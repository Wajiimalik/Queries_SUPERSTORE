-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE Shop_Basket
	-- Add the parameters for the stored procedure here
	@custID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	INSERT INTO Shopping_History (Total, ShopDate, DeliveryDate, DeliveryTime)
	VALUES ( (SELECT SUM(T_Price) FROM Basket WHERE CustID = @custID), GETDATE(), GETDATE(), GETDATE());

	INSERT INTO Shopped_Product(HistoryID, CustID, ProductID, Quantity, T_Price) 
	VALUES ( (SELECT MAX(HistoryID) FROM Shopping_History),  
		     @custID,
			 ( SELECT ProductID FROM Basket WHERE CustID = @custID ) 
			 ( SELECT Quantity FROM Basket WHERE CustID = @custID AND ProductID = p),

			 
    )

END
GO
