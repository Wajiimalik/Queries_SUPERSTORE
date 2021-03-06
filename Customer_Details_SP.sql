USE [db_SUPERSTORE]
GO
/****** Object:  StoredProcedure [dbo].[Customer_Details]    Script Date: 4/18/2015 6:51:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[Customer_Details]
	-- Add the parameters for the stored procedure here
	@id int 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
	u.UserID,
	(u.Fname + ' ' + u.Lname) AS [Name], 
	u.Email, 
	u.Date_Joined, 
	(u.Street + ' '  + u.HouseNo + ' '  + (SELECT TownName FROM Towns WHERE u.TownID = TownID)) AS [Address], 
	u.PhoneNo,
	c.Postcode
	FROM Users u, Customers c WHERE UserID = @id AND u.UserID = c.CustID;

END
