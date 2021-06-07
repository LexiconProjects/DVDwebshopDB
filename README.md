# DVDwebshopDB
Project meant for building a database from scratch. Add tables to the 
database, Insert data in to tables and query the database. All queries should 
be contained in one single query-file(.sql). 

### Required Features: 
* Create a database for a webshop of DVD movies with following entities 
and relationship 
* Movie: The movies are the products being sold in the web shop 
* Customer: Makes an order to the webshop and supplies information for 
billing and delivery of order.
* Order: Order details are saved to the database 
* OrderRows: Maintains the sale details of all orders.

![image](https://user-images.githubusercontent.com/43864105/120945897-03761400-c73b-11eb-9ad6-f15b7f799aaf.png)

### Relation 
Each Order is related to one customer and one or more OrderRows, which 
in turn contains the price of movies being sold in that order. 
Why does the Price column included in both the Movie and the OrderRow 
tables? Because the Movie - DVD price may change at any time in future. 
For a record we can trace the older price of the movie. For example let’s say 
a customer, Joe, buys the movie Se7en on January 12th 2015 for 179 kr. 
One year later, the price of Se7en is lowered to 79 kr. If we do not keep the 
Price column in the OrderRows table, we lose the price of the movie at time 
it was sold to Joe. The Price-column in the Movie table represents the 
current price of the movie. However, the Price-column in the OrderRows 
table represents the price of the movie at the time it was sold. 

### Code Requirements: 
CREATE DATABASE AND TABLES 
* Create all tables, as mentioned in diagram o Table names and column 
names should be exactly same as mentioned in diagram, even no 
misspellings allowed. 
* Set primary key and REFERENCES to other tables as mentioned in diagram 
Create the tables in right order, which will help you to reference to correct 
table. 
* Select the appropriate datatype for each column 
* Primary key should be automatically increased while adding new record to table 
* No column should allow NULL values. 

### Querries
#### INSERT 
* Insert following data to Movies and Customers table

![image](https://user-images.githubusercontent.com/43864105/120946024-5d76d980-c73b-11eb-9b50-3dc33facf24d.png)

![image](https://user-images.githubusercontent.com/43864105/120946030-610a6080-c73b-11eb-8880-7f45d40aaa33.png)


Write a queries to create orders and OrderRows for the following scenarios 

A. On 2015-01-01, Jonas Gray purchases Interstellar and Pulp Fiction 

B. On 2015-01-15, Peter Birro purchases 2 copies of The Wolf of Wall Street. 

C. On 2014-12-20, Jonas Gray purchased The Wolf of Wall Street. 


#### UPDATE
Write a query that changes the price of all movies made in 2014 to 169 kr.

#### SELECT
Write queries for the following SELECT operations: 
A. Get Firstname, Lastname, PhoneNo and Email to all Customers. 

B. Get all movies, ordered by Year from newest to oldest. 

C. Get all movie titles, ordered by Price, from cheapest to most expensive. 

D. Get Firstname, Lastname, DeliveryAddress, DeliveryZip, DeliveryCity for all 
customers who bought The Wolf of Wall Street. 

E. Get Id, Date, Customer (Firstname, Lastname) and total cost of every 
individual order. 

F. (Optional) Get Customer (Firstname, Lastname), total number of movies 
ordered by this customer, number of orders by this customer and total cost 
of all orders by this customer. 

G. (Optional) Get number of orders and total cost for all orders in the 
database.


#### COPY
* Add a new column, CellNo to the Customers table.
* Write a query to copy the information from PhoneNo to CellNo. 
* Write a query to empty the PhoneNo column(Sets it to an empty string)

Subjects Covered: 
* SQL Relational Database 
* Create Table 
* Insert Query 
* Select Query 
* Alter Table 
* Where Clause 
* Order By 
* Group By 
* Constraints 
* Using Joins

