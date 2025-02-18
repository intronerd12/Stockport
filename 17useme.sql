-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 17, 2025 at 04:22 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stockport`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adminID` int(11) NOT NULL,
  `adminUser` varchar(50) NOT NULL,
  `adminPassword` varchar(32) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auditlogs`
--

CREATE TABLE `auditlogs` (
  `LogID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Action` varchar(255) NOT NULL,
  `TableName` varchar(50) NOT NULL,
  `RecordID` int(11) NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `OldValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`OldValue`)),
  `NewValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`NewValue`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `billofmaterials`
--

CREATE TABLE `billofmaterials` (
  `BOMID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `MaterialID` int(11) NOT NULL,
  `QuantityRequired` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carriers`
--

CREATE TABLE `carriers` (
  `CarrierID` int(11) NOT NULL,
  `CarrierName` varchar(100) NOT NULL,
  `ContactPerson` varchar(100) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customerorders`
--

CREATE TABLE `customerorders` (
  `CustomerOrderID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `OrderDate` datetime NOT NULL DEFAULT current_timestamp(),
  `TotalAmount` decimal(10,2) DEFAULT NULL,
  `Status` enum('Pending','Processing','Shipped','Delivered','Cancelled') NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `CustomerID` int(11) NOT NULL,
  `CustomerName` varchar(100) NOT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `EmployeeID` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Role` varchar(45) NOT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `employeeEmail` varchar(100) DEFAULT NULL,
  `employeePassword` varchar(255) NOT NULL,
  `HireDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`EmployeeID`, `FirstName`, `LastName`, `Role`, `Phone`, `employeeEmail`, `employeePassword`, `HireDate`) VALUES
(1, 'Kim Jensen', 'Yebes', 'Admin', '09123456789', 'kimjensenyebes@gmail.com', '$2y$10$zgByliOTroett3FUGuvTbeK1mv0ERICQ.67kgsFql.xOXc6af8Cmm', '2025-02-17');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `InventoryID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `LocationID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL DEFAULT 0,
  `LastUpdatedDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `OrderDetailID` int(11) NOT NULL,
  `CustomerOrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `UnitPrice` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `productionorders`
--

CREATE TABLE `productionorders` (
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `EmployeeID` int(11) NOT NULL,
  `StartDate` datetime NOT NULL,
  `EndDate` datetime DEFAULT NULL,
  `Status` enum('Planned','In Progress','Completed','Cancelled') NOT NULL DEFAULT 'Planned',
  `QuantityOrdered` int(11) NOT NULL,
  `QuantityProduced` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ProductID` int(11) NOT NULL,
  `ProductName` varchar(100) NOT NULL,
  `Category` varchar(45) DEFAULT NULL,
  `Dimensions` varchar(45) DEFAULT NULL,
  `Weight` decimal(10,2) DEFAULT NULL,
  `ProductionCost` decimal(10,2) DEFAULT NULL,
  `SellingPrice` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rawmaterials`
--

CREATE TABLE `rawmaterials` (
  `MaterialID` int(11) NOT NULL,
  `MaterialName` varchar(100) NOT NULL,
  `SupplierID` int(11) DEFAULT NULL,
  `QuantityInStock` int(11) DEFAULT NULL,
  `UnitCost` decimal(10,2) DEFAULT NULL,
  `LastRestockedDate` date DEFAULT NULL,
  `MinimumStock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipments`
--

CREATE TABLE `shipments` (
  `ShipmentID` int(11) NOT NULL,
  `CustomerOrderID` int(11) NOT NULL,
  `CarrierID` int(11) NOT NULL,
  `ShipmentDate` datetime DEFAULT NULL,
  `TrackingNumber` varchar(100) DEFAULT NULL,
  `Status` enum('Pending','In Transit','Delivered','Failed') NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `SupplierID` int(11) NOT NULL,
  `SupplierName` varchar(100) NOT NULL,
  `ContactPerson` varchar(100) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warehouselocations`
--

CREATE TABLE `warehouselocations` (
  `LocationID` int(11) NOT NULL,
  `WarehouseName` varchar(45) NOT NULL,
  `Section` varchar(45) NOT NULL,
  `Capacity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminID`),
  ADD UNIQUE KEY `username` (`adminUser`);

--
-- Indexes for table `auditlogs`
--
ALTER TABLE `auditlogs`
  ADD PRIMARY KEY (`LogID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `billofmaterials`
--
ALTER TABLE `billofmaterials`
  ADD PRIMARY KEY (`BOMID`),
  ADD KEY `ProductID` (`ProductID`),
  ADD KEY `MaterialID` (`MaterialID`);

--
-- Indexes for table `carriers`
--
ALTER TABLE `carriers`
  ADD PRIMARY KEY (`CarrierID`);

--
-- Indexes for table `customerorders`
--
ALTER TABLE `customerorders`
  ADD PRIMARY KEY (`CustomerOrderID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`EmployeeID`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`InventoryID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`OrderDetailID`),
  ADD KEY `CustomerOrderID` (`CustomerOrderID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `productionorders`
--
ALTER TABLE `productionorders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `ProductID` (`ProductID`),
  ADD KEY `EmployeeID` (`EmployeeID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProductID`);

--
-- Indexes for table `rawmaterials`
--
ALTER TABLE `rawmaterials`
  ADD PRIMARY KEY (`MaterialID`),
  ADD KEY `idx_supplier` (`SupplierID`);

--
-- Indexes for table `shipments`
--
ALTER TABLE `shipments`
  ADD PRIMARY KEY (`ShipmentID`),
  ADD KEY `CustomerOrderID` (`CustomerOrderID`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`SupplierID`);

--
-- Indexes for table `warehouselocations`
--
ALTER TABLE `warehouselocations`
  ADD PRIMARY KEY (`LocationID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adminID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auditlogs`
--
ALTER TABLE `auditlogs`
  MODIFY `LogID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `billofmaterials`
--
ALTER TABLE `billofmaterials`
  MODIFY `BOMID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carriers`
--
ALTER TABLE `carriers`
  MODIFY `CarrierID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customerorders`
--
ALTER TABLE `customerorders`
  MODIFY `CustomerOrderID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `EmployeeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `InventoryID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `OrderDetailID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `productionorders`
--
ALTER TABLE `productionorders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rawmaterials`
--
ALTER TABLE `rawmaterials`
  MODIFY `MaterialID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipments`
--
ALTER TABLE `shipments`
  MODIFY `ShipmentID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `SupplierID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `warehouselocations`
--
ALTER TABLE `warehouselocations`
  MODIFY `LocationID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auditlogs`
--
ALTER TABLE `auditlogs`
  ADD CONSTRAINT `auditlogs_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `useraccounts` (`UserID`);

--
-- Constraints for table `billofmaterials`
--
ALTER TABLE `billofmaterials`
  ADD CONSTRAINT `billofmaterials_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`),
  ADD CONSTRAINT `billofmaterials_ibfk_2` FOREIGN KEY (`MaterialID`) REFERENCES `rawmaterials` (`MaterialID`);

--
-- Constraints for table `customerorders`
--
ALTER TABLE `customerorders`
  ADD CONSTRAINT `customerorders_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`);

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`);

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`CustomerOrderID`) REFERENCES `customerorders` (`CustomerOrderID`),
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`);

--
-- Constraints for table `productionorders`
--
ALTER TABLE `productionorders`
  ADD CONSTRAINT `productionorders_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`),
  ADD CONSTRAINT `productionorders_ibfk_2` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`);

--
-- Constraints for table `shipments`
--
ALTER TABLE `shipments`
  ADD CONSTRAINT `shipments_ibfk_1` FOREIGN KEY (`CustomerOrderID`) REFERENCES `customerorders` (`CustomerOrderID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
