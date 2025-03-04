USE [AdventureDb]
GO
/****** Object:  StoredProcedure [dbo].[prc_insertDimension]    Script Date: 04/03/2025 00:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[prc_insertDimension]
AS
BEGIN
	SET NOCOUNT ON;

	--=========== DimCategory ==========--
	MERGE INTO DimCategory AS destiny
	USING (
		SELECT DISTINCT Category FROM SalesRecords 
	) AS source 
	ON source.Category = destiny.CategoryName
	WHEN NOT MATCHED THEN
		INSERT (CategoryName)
		VALUES (source.Category);

	--=========== DimProduct ==========--
	MERGE INTO DimProduct AS destiny
	USING (
		SELECT DISTINCT [Product] FROM SalesRecords
	) AS source
	ON source.Product = destiny.ProductName
	WHEN NOT MATCHED THEN
		INSERT (ProductName)
		VALUES (source.Product);

	--=========== DimSeller =============--
	MERGE INTO DimSeller AS destiny
	USING (
		SELECT DISTINCT Seller FROM SalesRecords
	) AS source
	ON source.Seller = destiny.FullName
	WHEN NOT MATCHED THEN
		INSERT (FullName)
		VALUES (source.Seller);

	--=========== DimPayment ===========--
	MERGE INTO DimPayment AS destiny
	USING (
		SELECT DISTINCT PaymentMethod FROM SalesRecords
	) AS source
	ON source.PaymentMethod = destiny.PaymentName
	WHEN NOT MATCHED THEN
		INSERT (PaymentName)
		VALUES (source.PaymentMethod);

	--========== DimCalendar =============--
	MERGE INTO DimCalendar AS destiny
	USING (
		SELECT DISTINCT
			SaleDate,
			FORMAT(SaleDate, 'yyyyMMdd') AS DateID,  
			YEAR(SaleDate) AS Year,       
			MONTH(SaleDate) AS Month,        
			UPPER(FORMAT(SaleDate, 'MMM')) AS MonthName, 
			DAY(SaleDate) AS Day,           
			DATEPART(WEEKDAY, SaleDate) AS WeekDay,
			UPPER(FORMAT(SaleDate, 'ddd')) AS WeekDayName 
		FROM SalesRecords
	) AS source
	ON CAST(source.DateID AS INT) = destiny.TimeID
	WHEN NOT MATCHED THEN
		INSERT (TimeID, DateFull, Year, Month, MonthName, Day, WeekDay, WeekDayName)
		VALUES (CAST(source.DateID AS INT), source.SaleDate, source.Year,
				source.Month, source.MonthName, source.Day, source.WeekDay, source.WeekDayName);

END;
