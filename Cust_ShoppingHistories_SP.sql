USE [db_SUPERSTORE]
GO
/****** Object:  StoredProcedure [dbo].[Cust_ShoppingHistories]    Script Date: 5/14/2015 7:49:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[Cust_ShoppingHistories]
	-- Add the parameters for the stored procedure here
	@cust_id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT HistoryID, ShopDate, Total FROM Shopping_History 
	WHERE HistoryID IN (SELECT HistoryID FROM Basket WHERE CustID = @cust_id AND HistoryID is not NULL) ;

END
