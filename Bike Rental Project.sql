--USE [Bicycle project]

-- CREATION OF TABLES AND INSERTION OF VALUES

/*
CREATE TABLE Bike(
ID int,
PERSON_NAME varchar(40)
)

INSERT INTO Bike (ID, PERSON_NAME)
VALUES
(50, 'Nils Vanderstraeten')

ALTER TABLE Bk_users
ADD 
    EMAIL varchar(60),
    PHONE varchar(15);

UPDATE Bk_Users SET EMAIL = 'nil@yahoo.com' WHERE ID = 50
UPDATE Bk_Users SET PHONE = '(032)74658812' WHERE ID = 50

SELECT * FROM Bk_Users
*/

/*
CREATE TABLE Bike(
ID_BIKE int,
BIKE_NAME varchar(100),
BRAND varchar(30),
YEAR_BIKE int,
PRICE float
)

INSERT INTO Bike (ID_BIKE, BIKE_NAME, BRAND, YEAR_BIKE, PRICE)
VALUES
(37, 'FATHOM E+', 'Giant', 2018, 226.15)
*/

/*
CREATE TABLE Rental(
DATE_RENT date,
PRICE float,
LOCATION_FROM varchar(100),
LOCATION_TO varchar(100)
)

INSERT INTO Rental (DATE_RENT, PRICE, LOCATION_FROM, LOCATION_TO)
VALUES
('30-12-2019', 14.1, 'Kingston upon Thames', 'Richmond upon Thames')
SELECT * FROM Rental
*/

-- DETERMINATION OF PRIMARY AND FOREIGN KEYS

/*
ALTER TABLE Bike
ADD CONSTRAINT PK PRIMARY KEY (ID_BIKE)

ALTER TABLE Bk_Users
ADD CONSTRAINT PK PRIMARY KEY (ID)

ALTER TABLE Rental
ADD CONSTRAINT FK FOREIGN KEY (ID_USERS) REFERENCES BK_Users(ID);

ALTER TABLE Rental
ADD CONSTRAINT FK FOREIGN KEY (ID_BIKE) REFERENCES Bike(ID_BIKE);
*/

--QUERIES

-- Bikes that have been rented in the past 3 days

/*
SELECT Bike.BIKE_NAME
FROM Bike
INNER JOIN Rental
ON Bike.ID_BIKE = Rental.ID_BIKE
WHERE Rental.DATE_RENT > '2019-12-27'

-- Users that have been rented bikes in the past 5 days

SELECT Bk_Users.PERSON_NAME
FROM Bk_Users
INNER JOIN Rental
ON Bk_Users.ID = Rental.ID_USERS
WHERE Rental.DATE_RENT >= '2019-12-26'

-- Bikes that have been rented in travels from Chelsea or Fulham

SELECT DISTINCT Bike.BIKE_NAME
FROM Bike
INNER JOIN Rental
ON Bike.ID_BIKE = Rental.ID_BIKE
WHERE Rental.LOCATION_FROM IN ('Chelsea', 'Fulham')

-- Users that have been rented bikes in travels to Chelsea or Fulham

SELECT Bk_Users.PERSON_NAME
FROM Bk_Users
INNER JOIN Rental
ON Bk_Users.ID = Rental.ID_USERS
WHERE Rental.LOCATION_TO IN ('Chelsea', 'Fulham')

-- Users that have been rented bikes from the brand Cannondale

SELECT Bk_Users.PERSON_NAME
FROM Bk_Users
INNER JOIN Rental
ON Bk_Users.ID = Rental.ID_USERS
WHERE Rental.ID_BIKE IN 
	(SELECT ID_BIKE
	 FROM Bike
	 WHERE BRAND = 'Cannondale');
*/