-- SQLite syntax

-- Dimension Tables
CREATE TABLE CustomerDim (
    CustomerKey INTEGER PRIMARY KEY AUTOINCREMENT,
    CustomerID VARCHAR(50) NOT NULL UNIQUE,
    CustomerName VARCHAR(100),
    CustomerCountry VARCHAR(100)
);

CREATE TABLE ProductDim (
    ProductKey INTEGER PRIMARY KEY AUTOINCREMENT,
    StockCode VARCHAR(50) NOT NULL UNIQUE,
    Description VARCHAR(255),
    Category VARCHAR(50)
);

CREATE TABLE TimeDim (
    TimeKey INTEGER PRIMARY KEY AUTOINCREMENT,
    FullDate DATE NOT NULL UNIQUE,
    DayOfMonth INTEGER,
    Month INTEGER,
    Quarter INTEGER,
    Year INTEGER
);

-- Fact Table
CREATE TABLE SalesFact (
    SalesFactKey INTEGER PRIMARY KEY AUTOINCREMENT,
    TimeKey INTEGER NOT NULL,
    ProductKey INTEGER NOT NULL,
    CustomerKey INTEGER NOT NULL,
    Quantity INTEGER NOT NULL,
    UnitPrice REAL NOT NULL,
    TotalSales REAL NOT NULL,
    FOREIGN KEY (TimeKey) REFERENCES TimeDim(TimeKey),
    FOREIGN KEY (ProductKey) REFERENCES ProductDim(ProductKey),
    FOREIGN KEY (CustomerKey) REFERENCES CustomerDim(CustomerKey)
);