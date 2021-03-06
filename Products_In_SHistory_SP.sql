USE [db_SUPERSTORE]
GO
/****** Object:  StoredProcedure [dbo].[Products_In_SHistory]    Script Date: 5/14/2015 8:07:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[Products_In_SHistory]
	-- Add the parameters for the stored procedure here
	@historyID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT b.CustID, p.Name, (CAST(p.Prod_Weight AS varchar(10)) + p.Unit) AS [Weight], b.Quantity, b.T_Price  
	FROM Product p, Basket b
	WHERE b.HistoryID = @historyID AND p.ProductID = b.ProductID

END
