USE [db_SUPERSTORE]
GO
/****** Object:  StoredProcedure [dbo].[Add_Customer]    Script Date: 4/19/2015 8:24:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[Add_Customer]
	-- Add the parameters for the stored procedure here
	@FName varchar(30), 
	@LName varchar(30), 
	@Email varchar(50),
	@Date_Joined date,
	@Street varchar(30),
	@HouseNo varchar(30),
	@TownID int,
	@PhoneNo varchar(15),
	@PostCode int,
	@Password varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Users(FName,LName,Email,Date_Joined,Street,HouseNo,TownID,PhoneNo) VALUES(@FName, @LName, @Email, @Date_Joined, @Street, @HouseNo, @TownID, @PhoneNo);
	
	INSERT INTO Customers VALUES ( (SELECT UserID FROM UserS WHERE EMAIL = @Email) , @PostCode);
	
	INSERT INTO User_Login VALUES( (SELECT UserID FROM UserS WHERE EMAIL = @Email) , @Email, @Password);   
	
	    
END
