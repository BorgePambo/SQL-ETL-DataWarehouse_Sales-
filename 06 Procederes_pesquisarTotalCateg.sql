USE [AdventureDb]
GO
/****** Object:  StoredProcedure [dbo].[prc_TotalByCategory]    Script Date: 04/03/2025 00:50:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER   PROCEDURE [dbo].[prc_TotalByCategory]
    @Category NVARCHAR(200)  
AS
BEGIN
    SET NOCOUNT ON;  

    -- Verifica se a categoria existe na tabela DimCategory antes de executar a consulta
    IF EXISTS (SELECT 1 FROM DimCategory WHERE CategoryName = @Category)
    BEGIN
        SELECT 
            CAT.CategoryName AS 'CategoryName', 
            SUM(SF.TotalAmount) AS 'TotalAmount'
        FROM SaleFact AS SF  
        LEFT JOIN DimCategory AS CAT
            ON CAT.CategoryID = SF.CategoryID
        WHERE CAT.CategoryName = @Category
        GROUP BY CAT.CategoryName
        ORDER BY TotalAmount DESC;
    END
    ELSE 
    BEGIN
        PRINT 'Category not found!';
    END
END;
