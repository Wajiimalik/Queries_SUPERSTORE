USE [db_SUPERSTORE]
GO
/****** Object:  StoredProcedure [dbo].[Show_Basket]    Script Date: 5/14/2015 9:23:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[Show_Basket]
	-- Add the parameters for the stored procedure here
	@custID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT p.Name, (CAST(p.Prod_Weight AS varchar(10)) + p.Unit) AS [Weight], b.Quantity, b.T_Price  
	FROM Product p, Basket b
	WHERE b.CustID = @custID AND  p.ProductID = b.ProductID AND b.HistoryID is NULL
END
