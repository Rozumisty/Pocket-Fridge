

CREATE TABLE [Products] (
	id int NOT NULL IDENTITY(1, 1),
	name nvarchar(150) NOT NULL,
	categoryID int NOT NULL,
	createDate date NOT NULL,
	CONSTRAINT pk_Products_id PRIMARY KEY (Id)
)
GO
CREATE TABLE [UserFridge] (
	userId int NOT NULL,
	productId int NOT NULL,
	quantity smallint NOT NULL,
	additionDate date NOT NULL,
	expirationDate date NOT NULL,
	CONSTRAINT pk_UserFridge_userId_productId PRIMARY KEY (userId, productId)
)

GO
CREATE TABLE [Receipts] (
	id int NOT NULL IDENTITY(1, 1),
	name nvarchar(150) NOT NULL,
	instruction nvarchar(MAX) NOT NULL,
	video varbinary NOT NULL,
	countryId int NOT NULL,
	CONSTRAINT pk_Receipts_Id PRIMARY KEY (id)
)
GO
CREATE TABLE [Categories] (
	id int NOT NULL IDENTITY(1, 1),
	name nvarchar(100) NOT NULL,
	createDate date NOT NULL,
	storeFeatures nvarchar(1000) NOT NULL,
	CONSTRAINT pk_Categories_Id PRIMARY KEY (id)
)
GO
CREATE TABLE [Users] (
	id int NOT NULL IDENTITY(1, 1),
	firstName nvarchar(25) NOT NULL,
	lastName nvarchar(50) NOT NULL,
	login nvarchar(1000) NOT NULL,
	password nvarchar(1000) NOT NULL,
	email nvarchar(50) NOT NULL,
	isActive bit NOT NULL,
	isPremium bit NOT NULL,
	registerDate date NOT NULL,
	CONSTRAINT pk_Users_Id PRIMARY KEY (id)
)
GO
CREATE TABLE [Countries] (
	id int IDENTITY(1,1) NOT NULL,
	name nvarchar(50) NOT NULL,
	CONSTRAINT pk_Countries_Id PRIMARY KEY (id)

)
GO
CREATE TABLE [ReceiptsProducts] (
	receiptId int NOT NULL,
	productId int NOT NULL,
	CONSTRAINT pk_ReceiptsProducts_Id PRIMARY KEY (receiptId, productId)
)
GO
ALTER TABLE [Products] WITH CHECK ADD CONSTRAINT [fk_Products_Categories_CategoryID_ID] FOREIGN KEY ([categoryID]) REFERENCES [Categories]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Products] CHECK CONSTRAINT [fk_Products_Categories_CategoryID_ID]
GO

ALTER TABLE [UserFridge] WITH CHECK ADD CONSTRAINT [fk_UserFridge_User_UserID_ID] FOREIGN KEY ([userID]) REFERENCES [Users]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [UserFridge] CHECK CONSTRAINT [fk_UserFridge_User_UserID_ID]
GO
ALTER TABLE [UserFridge] WITH CHECK ADD CONSTRAINT [fk_UserFridge_Products_ProductID_ID] FOREIGN KEY ([productId]) REFERENCES [Products]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [UserFridge] CHECK CONSTRAINT [fk_UserFridge_Products_ProductID_ID]
GO

ALTER TABLE [Receipts] WITH CHECK ADD CONSTRAINT [fk_Receipts_Countries_CountryID_ID] FOREIGN KEY ([countryId]) REFERENCES [Countries]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Receipts] CHECK CONSTRAINT [fk_Receipts_Countries_CountryID_ID]
GO




ALTER TABLE [ReceiptsProducts] WITH CHECK ADD CONSTRAINT [fk_ReceptsProducts_Receipts_ReceiptID_ID] FOREIGN KEY ([receiptID]) REFERENCES [Receipts]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [ReceiptsProducts] CHECK CONSTRAINT [fk_ReceptsProducts_Receipts_ReceiptID_ID]
GO
ALTER TABLE [ReceiptsProducts] WITH CHECK ADD CONSTRAINT [fk_ReceptsProducts_Product_ProductID_ID] FOREIGN KEY ([productID]) REFERENCES [Products]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [ReceiptsProducts] CHECK CONSTRAINT [fk_ReceptsProducts_Product_ProductID_ID]
GO

DROP TABLE Countries
DROP TABLE UserFridge
DROP TABLE Receipts
DROP TABLE Products
DROP TABLE Categories
DROP TABLE ReceiptsProducts
DROP TABLE Users
