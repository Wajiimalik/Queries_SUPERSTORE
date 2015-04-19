--PRODUCT ADMINS
INSERT INTO Users(FName,LName,Email,Date_Joined,Street,HouseNo,TownID,PhoneNo) VALUES('Mohammad', 'Asim Khan', 'Asim_Khan@ymail.com', GETDATE(), 'good street', '567', 2 , '03314567876');
	
INSERT INTO Product_Admin VALUES ( (SELECT UserID FROM UserS WHERE EMAIL = 'Asim_Khan@ymail.com') , 25000);
	
INSERT INTO User_Login VALUES( (SELECT UserID FROM UserS WHERE EMAIL = 'Asim_Khan@ymail.com') , 'Asim_Khan@ymail.com', 'me.asim');   
	



INSERT INTO Users(FName,LName,Email,Date_Joined,Street,HouseNo,TownID,PhoneNo) VALUES('Ayesha', 'Ahmed', 'AyeshaAhmed@gmail.com', GETDATE(), 'fine street', '567', 5 , '03314567876');
	
INSERT INTO Product_Admin VALUES ( (SELECT UserID FROM UserS WHERE EMAIL = 'AyeshaAhmed@gmail.com') , 25000);
	
INSERT INTO User_Login VALUES( (SELECT UserID FROM UserS WHERE EMAIL = 'AyeshaAhmed@gmail.com') , 'AyeshaAhmed@gmail.com', 'ayeshagood');   
	


INSERT INTO Users(FName,LName,Email,Date_Joined,Street,HouseNo,TownID,PhoneNo) VALUES('Asad', 'Khalid', 'AsadKhalid@gmail.com', GETDATE(), 'fine street', '567', 6 , '03314567876');
	
INSERT INTO Product_Admin VALUES ( (SELECT UserID FROM UserS WHERE EMAIL = 'AsadKhalid@gmail.com') , 25000);
	
INSERT INTO User_Login VALUES( (SELECT UserID FROM UserS WHERE EMAIL = 'AsadKhalid@gmail.com') , 'AsadKhalid@gmail.com', 'asadhisahi');   
	



--PRODUCTS
INSERT INTO Product (Name, BrandID, Prod_Desc, Price, Prod_Weight, Unit, Stock, SubcatID) 
VALUES ('Peanut Butter', 2, 'Yummy & Delicious butter for breakfast with crunch of nuts', 700, 100, 'gram', 83, 7)

INSERT INTO Product (Name, BrandID, Prod_Desc, Price, Prod_Weight, Unit, Stock, SubcatID) 
VALUES ('Cold Coffee', 3, 'Chilled cold coffee, first time in pack in Pakistan', 35, 150, 'mL', 50, 23)


INSERT INTO Product (Name, BrandID, Prod_Desc, Price, Prod_Weight, Unit, Stock, SubcatID) 
VALUES ('Double Chocolate Ice-Cream', 3, 'xyz', 100, 250, 'gram', 50, 10)


--SHOPPING HISTORY
INSERT INTO Shopping_History (Total, ShopDate, DeliveryDate, DeliveryTime)
VALUES ('770', GETDATE(), '2015-04-25', '05:00')


INSERT INTO Shopping_History (Total, ShopDate, DeliveryDate, DeliveryTime)
VALUES ('350', '2015-04-18', '2015-04-18', '06:15')


--SHOPPED PRODUCTS
INSERT INTO Shopped_Product(HistoryID, ProductID, CustID, Quantity, T_Price)
VALUES (1, 1, 1, 1, 700)

INSERT INTO Shopped_Product(HistoryID, ProductID, CustID, Quantity, T_Price)
VALUES (1, 2, 1, 2, 70)

INSERT INTO Shopped_Product(HistoryID, ProductID, CustID, Quantity, T_Price)
VALUES (2, 2, 1, 10, 350)