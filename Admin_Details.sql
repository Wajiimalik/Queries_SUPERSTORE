USE [db_SUPERSTORE]
GO
/****** Object:  StoredProcedure [dbo].[Admin_Details]    Script Date: 4/19/2015 8:24:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[Admin_Details]
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
	p.Salary
	FROM Users u, Product_Admin p WHERE UserID = @id AND u.UserID = p.AdminID;

END
