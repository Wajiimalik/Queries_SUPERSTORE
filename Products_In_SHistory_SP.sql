USE [db_SUPERSTORE]
GO
/****** Object:  StoredProcedure [dbo].[Products_In_SHistory]    Script Date: 4/18/2015 6:48:55 PM ******/
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
	SELECT s.CustID, p.Name, (CAST(p.Prod_Weight AS varchar(10)) + p.Unit) AS [Weight], s.Quantity, s.T_Price  
	FROM Product p, Shopped_Product s
	WHERE s.HistoryID = @historyID AND p.ProductID = s.ProductID

END
