<?php
require_once 'session_check.php';

// The rest of your page code goes here - it will only execute if the user is logged in
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../assets/css/eminventory.css">
    <title>Warehouse Management System</title>
</head>
<body>
    <div class="container">
        <!-- Sidebar -->
        <div class="sidebar">
            <div class="logo">WMS Dashboard</div>
            <ul class="nav-menu">
                <li class="nav-item">
                    <a href="index.php" class="nav-link active">Overview</a>
                </li>
                <li class="nav-item">
                    <a href="inventory.php" class="nav-link">Inventory Management</a>
                </li>
                <li class="nav-item">
                    <a href="orders.php" class="nav-link">Order Processing</a>
                </li>
                <li class="nav-item">
                    <a href="warehouse.php" class="nav-link">Warehouse Operations</a>
                </li>
                <li class="nav-item">
                    <a href="reports.php" class="nav-link">Reports & Analytics</a>
                </li>
            </ul>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <!-- Header Area with Logout -->
            <div class="header-area">
                <h1>Dashboard Overview</h1>
                <a href="employee-logout.php" class="logout-btn">Logout</a> <!-- Updated logout link -->
            </div>
            
            <!-- Quick Stats -->
            <div class="dashboard-grid">
                <div class="card">
                    <div class="card-header">Current Inventory Status</div>
                    <div class="stat-grid">
                        <div class="stat-card">
                            <div class="stat-value">2,500</div>
                            <div class="stat-label">Total Stock</div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-value">15</div>
                            <div class="stat-label">Low Stock Alerts</div>
                        </div>
                    </div>
                </div>

                <div class="card">
                    <div class="card-header">Pending Orders</div>
                    <div class="stat-grid">
                        <div class="stat-card">
                            <div class="stat-value">42</div>
                            <div class="stat-label">Processing</div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-value">28</div>
                            <div class="stat-label">Shipped</div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Alerts Section -->
            <div class="card">
                <div class="card-header">Recent Alerts</div>
                <div class="alert">
                    Low stock alert: SKU-123 below threshold
                </div>
                <div class="alert">
                    Delayed shipment: Order #456
                </div>
            </div>

            <!-- Recent Orders Table -->
            <div class="card">
                <div class="card-header">Recent Orders</div>
                <table class="table">
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Customer</th>
                            <th>Status</th>
                            <th>Date</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>ORD-001</td>
                            <td>John Doe</td>
                            <td>Processing</td>
                            <td>2024-02-16</td>
                            <td>
                                <a href="view_order.php?id=ORD-001" class="btn">View</a>
                            </td>
                        </tr>
                        <tr>
                            <td>ORD-002</td>
                            <td>Jane Smith</td>
                            <td>Shipped</td>
                            <td>2024-02-16</td>
                            <td>
                                <a href="view_order.php?id=ORD-002" class="btn">View</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
