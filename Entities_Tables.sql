CREATE TABLE Brands
(
	BrandID int PRIMARY KEY IDENTITY(1,1), 
	BrandName varchar(30) NOT NULL UNIQUE
)


CREATE TABLE Categories
(
	CatID int PRIMARY KEY IDENTITY(1,1), 
	CatName varchar(30) NOT NULL UNIQUE
)


CREATE TABLE SubCategories
(
	SubcatID int PRIMARY KEY IDENTITY(1,1), 
	SubcatName varchar(30) NOT NULL UNIQUE,
	CatID int NOT NULL FOREIGN KEY REFERENCES Categories(CatID)
)


CREATE TABLE Product 
(
	ProductID int PRIMARY KEY IDENTITY(1,1), 
	Name varchar(50) NOT NULL, 
	BrandID int NOT NULL FOREIGN KEY REFERENCES Brands(BrandID), 
	Prod_Desc varchar(255) NOT NULL, 
	Price decimal NOT NULL, 
	Prod_Weight int NOT NULL, 
	Unit varchar(10) CHECK(Unit in ('gram', 'mL')), 
	Stock int NOT NULL DEFAULT 0, 
	SubcatID int NOT NULL FOREIGN KEY REFERENCES SubCategories(SubcatID), 
	DiscountPrice decimal DEFAULT 0, 
	DiscountOnQty int DEFAULT 0, 
	SavvyBuy bit DEFAULT 0, 
	AvgRating int DEFAULT 0, 
	BestSeller bit DEFAULT 0
)

CREATE TABLE Shopping_History
(
	HistoryID int PRIMARY KEY IDENTITY(1,1), 
	Total int NOT NULL, 
	ShopDate date NOT NULL DEFAULT GETDATE(), 
	DeliveryDate date NOT NULL, 
	DeliveryTime time NOT NULL
)
