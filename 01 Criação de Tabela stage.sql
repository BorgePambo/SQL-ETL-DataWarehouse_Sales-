CREATE TABLE SalesRecords (
    SaleID INT PRIMARY KEY IDENTITY(1,1),
    SaleDate DATE NOT NULL,
    Product NVARCHAR(200) NOT NULL,
    Category NVARCHAR(100) NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    UnitPrice MONEY NOT NULL CHECK (UnitPrice > 0),
    TotalAmount AS (Quantity * UnitPrice) PERSISTED,
    Seller NVARCHAR(200) NOT NULL,
    PaymentMethod NVARCHAR(200) NOT NULL
);
