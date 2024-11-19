/*
Created by: JJ
Created on: 19/11/2024
Description: Course - Dropping tables and managing schema changes
*/
--------------------------------------------------------------------
/*
Code Challenge | Drop the table
Drop the table TempProducts and test if it worked
*/
DROP TABLE TempProducts;

--Test
SELECT TABLE_NAME 
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_NAME = 'TempProducts';

/*
Code challenge | add and drop columns
Use alter table Products, first add column weight with a decimal data type, 
allowing precision values up to 5 digits with 2 decimal places
then drop the OLDFeature column and test both result
*/
ALTER TABLE Products
ADD COLUMN Weight DECIMAL(5,2);

ALTER TABLE Products
DROP COLUMN OldFeature;

--Test
SELECT COLUMN_NAME 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'Products' AND COLUMN_NAME IN ('Weight', 'OldFeature');

/*
Code challenge | Rename tables and columns
Use Alter to rename the Products table to Inventory;
rename the Price column in the renamed table to UnitPrice;
test the result
*/
ALTER TABLE Products
RENAME TO Inventory;

ALTER TABLE Inventory
RENAME COLUMN Price TO UnitPrice;

--Test
SELECT ProductName, UnitPrice, StockQuantity FROM Inventory;

/*
Code challenge | Modifying data structure
Use alter to change the tata type stored in the StockQuantity column in the Inventory table from INTEGER TO BIGINT;
Test the change
*/
ALTER TABLE Inventory
ALTER COLUMN StockQuantity BIGINT;

--Test
SELECT ProductName, UnitPrice, StockQuantity FROM Inventory;

/*
Code Challenge | Create table
Create table Customers with following columns:
  CustomerID(Primary Key, INT, Auto Increment)
  FirstName(VARCHAR(50), NOT NULL)
  LastName(VARCHAR(50), NOT NULL)
  Email(VARCHAR(100), NOT NULL)
  JoinDate(DATE, NOT NULL)
After table is created, add a column:
  PhoneNumber(VARCHAR(15), NOT NULL)
*/
CREATE TABLE Customers(
  CustomerID INT PRIMARY KEY AUTO_INCREMENT,
  FirstName VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  Email VARCHAR(100) NOT NULL,
  JoinDate DATE NOT NULL
);

ALTER TABLE Customers
ADD COLUMN PhoneNumber VARCHAR(15) NOT NULL;

--Test
SELECT CustomerID, FirstName, LastName, Email, JoinDate, PhoneNumber FROM Customers LIMIT 5;

/*
Code Challenge | Drop the table
Drop the OldOrders table; Test result
*/
DROP TABLE OldOrders;

--Test
SELECT TABLE_NAME 
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_NAME = 'OLDORDERS';