USE [AdventureDb]
GO
/****** Object:  StoredProcedure [dbo].[prc_inserSalesFact]    Script Date: 04/03/2025 00:46:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[prc_inserSalesFact]
AS
BEGIN
	SET NOCOUNT ON 

		MERGE INTO SaleFact AS destiny
		USING (
			SELECT
				cal.TimeID AS DateID,
				prd.ProductID,
				cat.CategoryID,
				sel.SellerID,
				Pm.PaymentID AS PaymentMethodID,
				sre.UnitPrice,
				sre.Quantity,
				sre.TotalAmount
			FROM SalesRecords AS sre
				INNER JOIN DimCategory AS cat ON cat.CategoryName = sre.Category
				INNER JOIN DimProduct AS prd ON prd.ProductName = sre.[Product]
				INNER JOIN DimSeller AS sel ON sel.FullName = sre.Seller
				INNER JOIN DimPayment AS Pm ON Pm.PaymentName = sre.PaymentMethod
				INNER JOIN DimCalendar AS cal ON cal.TimeID = CAST(FORMAT(sre.SaleDate, 'yyyyMMdd') AS INT)
		) AS source
		ON source.DateID = destiny.DateID
		AND source.ProductID = destiny.ProductID
		AND source.SellerID = destiny.SellerID  -- Adicionado para evitar duplicatas
		WHEN NOT MATCHED THEN
			INSERT (DateID, ProductID, CategoryID, SellerID, 
					PaymentMethodID, UnitPrice, Quantity, TotalAmount)
			VALUES (source.DateID, source.ProductID, source.CategoryID, source.SellerID,
					source.PaymentMethodID, source.UnitPrice, source.Quantity, source.TotalAmount);


END;
