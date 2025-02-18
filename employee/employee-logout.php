<?php
session_start();  // Start the session
session_unset();  // Remove all session variables
session_destroy();  // Destroy the session
header("Location: /stockport/employee-login.php");  // Redirect to the login page
exit();  // Ensure no further code is executed after the redirect
?>
