CREATE TABLE Towns
(
	TownID int PRIMARY KEY IDENTITY(1,1), 
	TownName varchar(15) UNIQUE NOT NULL
)

CREATE TABLE Users
(
	UserID int PRIMARY KEY IDENTITY(1,1),
	Fname varchar(30) NOT NULL,
	Lname varchar(30),
	Email varchar(50) NOT NULL UNIQUE,
	Date_Joined date NOT NULL DEFAULT GETDATE(),
	Street int NOT NULL,
	HouseNo int NOT NULL,
	TownID int NOT NULL FOREIGN KEY REFERENCES Towns(TownID),
	PhoneNo int NOT NULL
)

CREATE TABLE User_Login
(
	--UserID int PRIMARY KEY FOREIGN KEY REFERENCES Users(UserID),
	UserID int PRIMARY KEY,
	Email varchar(50)  NOT NULL UNIQUE,
	PW varchar(30) NOT NULL CHECK( LEN([PW]) BETWEEN 6 AND 10 )
)

CREATE TABLE Customers
(
	--CustID int PRIMARY KEY FOREIGN KEY REFERENCES Users(UserID),
	CustID int PRIMARY KEY,
	Postcode int NOT NULL
)

CREATE TABLE Product_Admin
(
	--AdminID int PRIMARY KEY FOREIGN KEY REFERENCES Users(UserID),
	AdminID int PRIMARY KEY,
	Salary decimal NOT NULL
)


CREATE TABLE Rate_Product
(
	--CustID int NOT NULL FOREIGN KEY REFERENCES Customers(CustID),
	--ProductID int NOT NULL FOREIGN KEY REFERENCES Product(ProductID),
	CustID int NOT NULL,
	ProductID int NOT NULL,
	Rating int check(Rating BETWEEN 1 AND 5),
	CONSTRAINT pk_RateProduct PRIMARY KEY (CustID,ProductID)
)


CREATE TABLE Manage_Product
(
	--AdminID int NOT NULL FOREIGN KEY REFERENCES Product_Admin(AdminID),
	--ProductID int NOT NULL FOREIGN KEY REFERENCES Product(ProductID),
	AdminID int NOT NULL,
	ProductID int NOT NULL,
	M_Date date NOT NULL DEFAULT GETDATE(),
	M_Time time NOT NULL DEFAULT GETDATE(),
	M_Desc varchar(10) NOT NULL CHECK (M_Desc in ('Add','Update')),
	CONSTRAINT pk_MProduct PRIMARY KEY (AdminID,ProductID)
)


CREATE TABLE Shopped_Product
(
	--HistoryID int NOT NULL FOREIGN KEY REFERENCES Shopping_History(HistoryID),
	--ProductID int NOT NULL FOREIGN KEY REFERENCES Product(ProductID),
	--CustID int NOT NULL FOREIGN KEY REFERENCES Customers(CustID),
	HistoryID int NOT NULL,
	ProductID int NOT NULL,
	CustID int NOT NULL,
	Quantity int NOT NULL DEFAULT 1,
	T_Price decimal NOT NULL,
	CONSTRAINT pk_SProduct PRIMARY KEY (HistoryID, ProductID, CustID)
)


CREATE TABLE Basket
(
	--CustID int NOT NULL FOREIGN KEY REFERENCES Customers(CustID), 
	--ProductID int NOT NULL FOREIGN KEY REFERENCES Product(ProductID),
	CustID int NOT NULL,
	ProductID int NOT NULL,
	Quantity int NOT NULL DEFAULT 1,
	T_Price decimal NOT NULL,
	CONSTRAINT pk_Basket PRIMARY KEY (ProductID, CustID)
)


CREATE TABLE Favourites 
(
	--ProductID int NOT NULL FOREIGN KEY REFERENCES Product(ProductID),
	--CustID int NOT NULL FOREIGN KEY REFERENCES Customers(CustID),
	CustID int NOT NULL,
	ProductID int NOT NULL,
	CONSTRAINT pk_Favourite PRIMARY KEY (ProductID, CustID)
)