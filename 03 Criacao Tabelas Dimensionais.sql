



CREATE TABLE DimCategory(
	CategoryID INTEGER PRIMARY KEY IDENTITY(1, 1),
	CategoryName NVARCHAR(200) NOT NULL
);

CREATE TABLE DimProduct(
	ProductID INTEGER PRIMARY KEY IDENTITY(101, 1),
	ProductName NVARCHAR(200) NOT NULL
);

CREATE TABLE DimPayment(
	PaymentID INTEGER PRIMARY KEY IDENTITY(1001, 1),
	PaymentName NVARCHAR(200) NOT NULL
)

CREATE TABLE DimSeller(
	SellerID INTEGER PRIMARY KEY IDENTITY(3001, 1),
	FullName NVARCHAR(200) NOT NULL
);

CREATE TABLE DimCalendar(
	TimeID INTEGER PRIMARY KEY,
	DateFull DATE,
	[Year] INT,
	[Month] INT,
	[MonthName] NVARCHAR(25),
	[Day] INT,
	[WeekDay] INT,
	[WeekDayName] NVARCHAR(100)
 );






CREATE TABLE SaleFact(
	DateID INT,
	ProductID INT,
	CategoryID INT,
	SellerID INT,
	PaymentMethodID INT,
	UnitPrice MONEY CHECK(UnitPrice > 0),
	Quantity MONEY,
	TotalAmount MONEY
);


