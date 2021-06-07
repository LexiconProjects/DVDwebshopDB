
CREATE DATABASE DVDwebshopDatabase;

USE DVDwebshopDatabase;

CREATE TABLE Customers(
id int IDENTITY(1,1) NOT NULL ,
Firstname varchar(255) NOT NULL,
Lastname varchar(255) NOT NULL,
BillingAddress varchar(255) NOT NULL,
BillingZip int NOT NULL,
BillingCity varchar(255) NOT NULL,
DeliveryAddress varchar(255) NOT NULL,
DeliveryZip int NOT NULL,
DeliveryCity varchar(255) NOT NULL,
EmailAddress varchar(255) NOT NULL,
PhoneNo varchar(13) NOT NULL,
PRIMARY KEY(id)
);

CREATE TABLE Orders(
id int IDENTITY(1,1) NOT NULL ,
OrderDate varchar(255) NOT NULL,
PRIMARY KEY (id),
CustomerId int NOT NULL FOREIGN KEY REFERENCES Customers(id)
);

CREATE TABLE Movies(
id int IDENTITY(1,1) NOT NULL ,
Title varchar(255) NOT NULL,
Director varchar(255) NOT NULL,
ReleaseYear SMALLINT NOT NULL,
Price decimal(6,2) NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE OrderRows(
id int IDENTITY(1,1) NOT NULL ,
OrderId varchar(255) NOT NULL,
Price decimal(7,2) NOT NULL,
PRIMARY KEY (id),
MovieId int NOT NULL FOREIGN KEY REFERENCES Movies(id)
);



INSERT INTO Movies(Title,Director,ReleaseYear,Price)
VALUES ('Interstellar', 'Christopher Nolan', 2014, 179.00);

INSERT INTO Movies(Title,Director,ReleaseYear,Price)
VALUES ('Hobbit: Battle of the five armies', 'Peter Jackson', 2014, 179.00);

INSERT INTO Movies(Title,Director,ReleaseYear,Price)
VALUES ('The Wolf of Wall Street', 'Martin Scorcese', 2013, 119.00);

INSERT INTO Movies(Title,Director,ReleaseYear,Price)
VALUES ('Pulp Fiction', 'Quentin Tarantino', 1994, 49.00);


INSERT INTO Customers(Firstname,Lastname,BillingAddress,BillingZip,BillingCity,DeliveryAddress,DeliveryZip,DeliveryCity,EmailAddress,PhoneNo)
VALUES ('Jonas', 'Gray', '23 Green Corner Street',56743,'Birmingham','23 Green Corner Street', 56743,'Birmingham', 'jonas.gray@hotmail.com','0708123455');

INSERT INTO Customers(Firstname,Lastname,BillingAddress,BillingZip,BillingCity,DeliveryAddress,DeliveryZip,DeliveryCity,EmailAddress,PhoneNo)
VALUES ('Jane', 'Harolds', '10 West Street',43213,'London','10 West Street',43213,'London','jane_h77@gmail.com','0701245512');

INSERT INTO Customers(Firstname,Lastname,BillingAddress,BillingZip,BillingCity,DeliveryAddress,DeliveryZip,DeliveryCity,EmailAddress,PhoneNo)
VALUES ('Peter', 'Birro', '12 Fox Street',45581,'New York', '89 Moose Plaza',45321,'Seattle', 'peter_the_great@hotmail.com','0739484322');

/*
 * Querry A, B, C
 */

INSERT INTO Orders(OrderDate,CustomerId) 
VALUES('2015-01-01',1),('2015-01-15', 3),('2014-12-20', 1);

INSERT INTO OrderRows(OrderId,MovieId,Price)
VALUES (1, 1, 179.00),(2, 3, 119.00),(2, 3, 119.00),(3, 3, 119.00);

/*
 * UPDATE Querry
 */

 UPDATE Movies
 SET Price=169
 WHERE ReleaseYear=2014;

 /*
  * SELECT Querries
  */

/*A*/  SELECT Firstname,Lastname,PhoneNo,EmailAddress FROM Customers;
/*B*/  SELECT * FROM Movies ORDER BY ReleaseYear DESC;
/*C*/  SELECT Title FROM Movies ORDER BY Price ASC;
/*D*/  SELECT DISTINCT Customers.Firstname,Customers.Lastname, Customers.DeliveryAddress, Customers.DeliveryZip, Customers.DeliveryCity 
		FROM (Customers INNER JOIN Orders ON Customers.id=Orders.CustomerId INNER JOIN OrderRows ON Orders.id=OrderRows.OrderId) 
		WHERE OrderRows.MovieId=3;

/*E*/  SELECT Orders.id,Orders.OrderDate,Customers.Firstname,Customers.Lastname,t.Total
	    FROM (Customers INNER JOIN Orders ON Customers.id = Orders.CustomerId INNER JOIN( 
	     SELECT OrderId, SUM(Price) AS Total
		   FROM OrderRows
		   GROUP BY OrderId) AS t ON Orders.id = t.OrderId);

/*
 * COPY Querry
 */

 ALTER TABLE Customers
 ADD CellNo varchar(13);

 UPDATE Customers  
 SET CellNo = PhoneNo;

 UPDATE Customers  
 SET PhoneNo='';

