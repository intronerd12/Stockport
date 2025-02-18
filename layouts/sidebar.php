<?php
// Get the current file name
$current_page = basename($_SERVER['PHP_SELF']);
?>

<div class="sidebar">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <h2 class="sidebar-title">Warehouse</h2>
    <ul class="sidebar-menu">
        <li>
            <a href="dashboard.php" class="<?= ($current_page == 'dashboard.php') ? 'active' : ''; ?>">
                <i class="fas fa-tachometer-alt"></i> Dashboard
            </a>
        </li>

        <li>
            <a href="customers.php" class="<?= ($current_page == 'customers.php') ? 'active' : ''; ?>">
                <i class="fas fa-users"></i> Customer
            </a>
        </li>

        <li>
            <a href="suppliers.php" class="<?= ($current_page == 'suppliers.php') ? 'active' : ''; ?>">
                <i class="fas fa-truck"></i> Supplier
            </a>
        </li>

        <!-- Dropdown -->
        <li class="dropdown">
            <a href="#" class="dropdown-toggle <?= (strpos($current_page, 'inventory') !== false) ? 'active' : ''; ?>">
                <i class="fas fa-warehouse"></i> Inventory Management
            </a>
            <ul class="dropdown-menu">
                <li>
                    <a href="incoming_stock.php" class="<?= ($current_page == 'incoming_stock.php') ? 'active' : ''; ?>">
                        <i class="fas fa-cubes"></i> Incoming Stock
                    </a>
                </li>
                <li>
                    <a href="outgoing_shipments.php" class="<?= ($current_page == 'outgoing_shipments.php') ? 'active' : ''; ?>">
                        <i class="fas fa-box"></i> Outgoing Shipments
                    </a>
                </li>
            </ul>
        </li>

        <li>
            <a href="expenses.php" class="<?= ($current_page == 'expenses.php') ? 'active' : ''; ?>">
                <i class="fas fa-dollar-sign"></i> Expenses
            </a>
        </li>

        <li>
            <a href="staff.php" class="<?= ($current_page == 'staff.php') ? 'active' : ''; ?>">
                <i class="fas fa-user-tie"></i> Staff
            </a>
        </li>

        <li>
            <a href="reports.php" class="<?= ($current_page == 'reports.php') ? 'active' : ''; ?>">
                <i class="fas fa-chart-bar"></i> Reports/Analytics
            </a>
        </li>
    </ul>
</div>