<?php
session_start();

// Include database connection
include('server/database.php');

// Check if connection is established
if (!isset($conn) || $conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Define regex for email validation
$emailRegex = "/^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/";

$error = '';
$success = '';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Handle Login
    if (isset($_POST['logemail']) && isset($_POST['logpass'])) {
        $email = $_POST['logemail'];
        $password = $_POST['logpass'];

        // Validate email format
        if (!preg_match($emailRegex, $email)) {
            $error = "Invalid email format";
        } else {
            // Prevent SQL injection by using prepared statement
            $stmt = $conn->prepare("SELECT * FROM employees WHERE employeeEmail = ?");
            $stmt->bind_param("s", $email);
            $stmt->execute();
            $result = $stmt->get_result();
            
            if ($result->num_rows > 0) {
                $employee = $result->fetch_assoc();
                
                // Verify the password with the hashed password stored in the database
                if (password_verify($password, $employee['employeePassword'])) {
                    // Store session and redirect to employee dashboard
                    $_SESSION['employee_id'] = $employee['EmployeeID'];
                    $_SESSION['employee_name'] = $employee['FirstName'] . ' ' . $employee['LastName'];
                    $_SESSION['employee_email'] = $employee['employeeEmail'];
                    $_SESSION['employee_role'] = $employee['Role'];
                    
                    header('Location: employee/inventory.php'); // Redirect after successful login
                    exit();
                } else {
                    $error = "Incorrect password";
                }
            } else {
                $error = "No employee found with that email";
            }
            
            $stmt->close();
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Stockport - Employee Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
    <div class="container">
        <div class="login-container">
            <div class="login-header">
                <h2>Stockport Management</h2>
                <p>Employee Login</p>
            </div>
            
            <?php if (!empty($error)) { ?>
                <div class="alert alert-danger">
                    <?php echo $error; ?>
                </div>
            <?php } ?>

            <?php if (!empty($success)) { ?>
                <div class="alert alert-success">
                    <?php echo $success; ?>
                </div>
            <?php } ?>
            
            <form method="POST" action="">
                <div class="form-group">
                    <label for="logemail"><i class="fas fa-envelope"></i> Email</label>
                    <input type="email" name="logemail" id="logemail" placeholder="Enter your email" required>
                </div>
                
                <div class="form-group">
                    <label for="logpass"><i class="fas fa-lock"></i> Password</label>
                    <input type="password" name="logpass" id="logpass" placeholder="Enter your password" required>
                </div>
                
                <div class="form-group remember-me">
                    <input type="checkbox" name="remember" id="remember">
                    <label for="remember">Remember me</label>
                </div>
                
                <div class="form-group">
                    <button type="submit" class="login-btn">Login</button>
                </div>
                
                <div class="form-links">
                    <a href="forgot-password.php">Forgot Password?</a>
                    <a href="employee-register.php">New Employee? Register</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
