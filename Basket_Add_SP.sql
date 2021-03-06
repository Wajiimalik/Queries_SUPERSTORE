USE [db_SUPERSTORE]
GO
/****** Object:  StoredProcedure [dbo].[Basket_Add]    Script Date: 5/14/2015 4:47:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[Basket_Add]
	@custID int,
	@prodID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;



	 IF EXISTS (SELECT * FROM dbo.Basket  WHERE CustID = @CustID AND ProductID = @prodID AND HistoryID is NULL)
        -- if it exists - update "Quantity" by 1
			UPDATE dbo.Basket
			SET Quantity = Quantity + 1,
				T_Price = (T_Price + (SELECT Price FROM Product WHERE ProductID = @prodID) )


			WHERE CustID = @custID AND ProductID = @prodID AND HistoryID is NULL



    ELSE
        -- if it does not yet exist - create new row
        INSERT INTO dbo.Basket(CustID, ProductID, Quantity, T_Price)
        VALUES (
			@custID, 
			@prodID, 
			1, 
			(SELECT Price FROM Product WHERE ProductID = @prodID)
		
		)

END