USE [db_SUPERSTORE]
GO
/****** Object:  StoredProcedure [dbo].[Basket_Sub]    Script Date: 5/14/2015 4:53:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[Basket_Sub]
	-- Add the parameters for the stored procedure here
	@custID int,
	@prodID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


	 IF 
		(EXISTS (SELECT * FROM dbo.Basket  WHERE CustID = @CustID AND ProductID = @prodID AND HistoryID is NULL))  
		AND 
		(SELECT Quantity FROM dbo.Basket  WHERE CustID = @CustID AND ProductID = @prodID AND HistoryID is NULL) >  1

	 BEGIN
      -- if it exists - update "Quantity" by 1
			UPDATE dbo.Basket
				SET Quantity = Quantity - 1,
				T_Price = (T_Price - (SELECT Price FROM Product WHERE ProductID = @prodID) )


				WHERE CustID = @custID AND ProductID = @prodID AND HistoryID is NULL
	 END	




  	 ELSE IF 
			(EXISTS (SELECT * FROM dbo.Basket  WHERE CustID = @CustID AND ProductID = @prodID AND HistoryID is NULL))  
			AND 
			(SELECT Quantity FROM dbo.Basket  WHERE CustID = @CustID AND ProductID = @prodID AND HistoryID is NULL) = 1
	
	 BEGIN
	        DELETE FROM Basket WHERE CustID = @CustID AND ProductID = @prodID AND HistoryID is NULL
   	 END

END
