USE master
GO

DROP DATABASE IF EXISTS QuickCart;
GO

CREATE DATABASE QuickCart;
GO

USE QuickCart;
GO

CREATE TABLE Shops (
	ShopId int NOT NULL PRIMARY KEY IDENTITY(1,1),
	Name nvarchar(300) NOT NULL,
	Description nvarchar(300) NOT NULL,
	EmailAddress nvarchar(300) NOT NULL,
	Password nvarchar(300) NOT NULL,
	DateAdded DATETIME DEFAULT(CURRENT_TIMESTAMP),
	IsActive bit DEFAULT(1)
)

-- SHOPS CREATE CATEGORIES WHICH CONTAIN PRODUCTS
-- THIS FORCES ORGANIZATION SINCE NO ITEMS CAN JUST BE ON THEIR OWN
CREATE TABLE Categories (
	CategoryId int NOT NULL PRIMARY KEY IDENTITY(1,1),
	ShopId int NOT NULL,
	Name nvarchar(300) NOT NULL,
	Description nvarchar(300) NOT NULL,
	IsActive bit DEFAULT(1)
)

-- Items are associated to categories
CREATE TABLE Items (
	ItemId int NOT NULL PRIMARY KEY IDENTITY(1,1),
	CategoryId int NOT NULL,
	Name nvarchar(300) NOT NULL,
	Description nvarchar(300) NOT NULL,
	Unit nvarchar(300) NOT NULL,
	Cost money NOT NULL,
	IsAvailable bit DEFAULT(1),
	DateAdded DATETIME DEFAULT(CURRENT_TIMESTAMP),
	IsActive bit DEFAULT(1)
)

CREATE TABLE Orders (
	OrderId int NOT NULL PRIMARY KEY IDENTITY(1,1),
	CustomerId int NOT NULL,
	CustomerNotes nvarchar(300) NOT NULL,
	ShopNotes nvarchar(300) NOT NULL,
	DateAdded DATETIME DEFAULT(CURRENT_TIMESTAMP),
	DateDelivered DATETIME NULL DEFAULT(NULL),
)

-- An order consists of a list of items
CREATE TABLE OrdersItems (
	OrderId int NOT NULL,
	ItemId int NOT NULL,
	Quantity int NOT NULL,
)

-- Customers can shop in any store in the database
CREATE TABLE Customers (
	CustomerId int NOT NULL PRIMARY KEY IDENTITY(1,1),
	FirstName nvarchar(300) NOT NULL,
	LastName nvarchar(300) NOT NULL,
	EmailAddress nvarchar(300) NOT NULL,
	Password nvarchar(300) NOT NULL,
	DateAdded DATETIME DEFAULT(CURRENT_TIMESTAMP),
	IsActive bit DEFAULT(1)
)

-- THIS CAN ALSO BE MOVED GOTTEN FROM ORDERS
CREATE TABLE CustomerShops (
	CustomerId int NOT NULL,
	ShopId int NOT NULL
)