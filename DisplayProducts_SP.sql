USE [db_SUPERSTORE]
GO
/****** Object:  StoredProcedure [dbo].[DisplayProducts]    Script Date: 5/14/2015 9:18:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[DisplayProducts]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 

	ProductID, 
	Name, Prod_Desc, 
	(CAST(Price AS varchar(10)) + ' ' + 'Rs') AS [Price] ,
	(CAST(Prod_Weight AS varchar(10)) + Unit) AS [Weight],
	 DiscountPrice, 
	 DiscountOnQty,
	CAST(
             CASE 
                  WHEN ((DiscountPrice) <= (Price * DiscountOnQty * 0.7)) AND (DiscountPrice != 0)
                     THEN 1
                  ELSE 0 
             END AS bit) AS [SavvyBuy],
	(SELECT BrandName FROM Brands WHERE BrandID = Product.BrandID ) AS BrandName

	FROM Product ORDER BY Name

END
