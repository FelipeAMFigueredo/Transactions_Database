USE master;
GO
CREATE DATABASE TransactionDatabase;
GO

CREATE TABLE Bank(
	Id int PRIMARY KEY IDENTITY(1,1),
	Name varchar(100)
);
GO

CREATE TABLE Client(
	Id int PRIMARY KEY IDENTITY(1,1),
	Name varchar(100)
);
GO

CREATE TABLE Category(
	Id int PRIMARY KEY IDENTITY(1,1),
	Name varchar(30)
);
GO

CREATE TABLE Trade(
	Id int PRIMARY KEY IDENTITY(1,1),
	IdClient int FOREIGN KEY(IdClient) REFERENCES Client(Id),
	Value numeric(8,3),
	ClientSector varchar(30)
);
GO

CREATE TABLE ListOfCategories(
	Id int PRIMARY KEY IDENTITY(1,1),
	IdBank int FOREIGN KEY(IdBank) REFERENCES Bank(Id),
	IdTrade int  FOREIGN KEY(IdTrade) REFERENCES Trade(Id),
	IdCategory int FOREIGN KEY(IdCategory) REFERENCES Category(Id)
);
GO

INSERT INTO Bank VALUES('Bank Test');
INSERT INTO Client VALUES('Client Test');

INSERT INTO Category VALUES('LOWRISK');
INSERT INTO Category VALUES('MEDIUMRISK');
INSERT INTO Category VALUES('HIGHRISK');

INSERT INTO Trade VALUES(900.000, 'Public');
INSERT INTO Trade VALUES(1200.000, 'Public');
INSERT INTO Trade VALUES(1200.000, 'Private');

INSERT INTO ListOfCategories VALUES(1,1,NULL);
INSERT INTO ListOfCategories VALUES(1,2,NULL);
INSERT INTO ListOfCategories VALUES(1,3,NULL);
GO