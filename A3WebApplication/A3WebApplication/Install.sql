-- 30 MARKS TOTAL

-- TODO: Database

-- Complete these tables (3 marks), 
-- inserts (1 mark) 
-- stored procedures (20 marks total)
-- reports (6 marks)
use master
go
drop database dbAssessment03
go
create database dbAssignment03
go
use dbAssessment03
go
CREATE TABLE tbCustomer -- AccessLevel is a BIT, 1 is admin, 0 is not an admin
(
CustomerID int primary key identity(1,1),
UserName varchar(max),
Password varchar(max),
FirstName varchar(max),
LastName varchar(max),
Address varchar(max),
City varchar(max),
PhoneNumber int,
AccessLevel varchar(10) -- admin = 1 & not admin = 0
)
CREATE TABLE tbCategory
(
CategoryID int primary key identity(1,1),
Name varchar(max),
ImagePath varchar(max)
)
CREATE TABLE tbProduct -- there are many products in a single category
(
ProductID int primary key identity(1,1),
Name varchar(max),
price decimal(7,2),
PrimaryImagePath varchar(max),
CategoryID int references tbCustomer(CustomerID)
)
CREATE TABLE tbOrder -- an order happens on a date by a customer
(
OrderID int primary key identity(1,1),
OrderDate date,
PricePaid decimal(7,2),
CustomerID int references tbCustomer(CustomerID)
)
CREATE TABLE tbOrderDetail -- there can be many details in an order, each detail contains the product purchased, the price paid at the time for the product multiplied by the quantity
(
OrderDetailID int primary key identity(1,1),
Quantity int,
SubTotal decimal(7,2),
OrderID int references tbOrder(OrderID),
ProductID int references tbProduct(ProductID)
)

INSERT INTO tbCustomer -- 5, 1 admin, 4 non-admins 
(UserName,Password,FirstName,LastName,Address,City,PhoneNumber,AccessLevel)values
('Admin','AdminPass','AdminFirstName','AdminLastName','FromNoWhere','CityOfLight',555-555-5555,'1'),
('NormalUser1','NormalUserPass1','NormalFirstName1','NormalLastName1','FromnoWhere1','CityofLight1','0'),
('NormalUser2','NormalUserPass2','NormalFirstName2','NormalLastName2','FromnoWhere2','CityofLight2','0'),
('NormalUser3','NormalUserPass3','NormalFirstName3','NormalLastName3','FromnoWhere3','CityofLight3','0'),
('NormalUser4','NormalUserPass4','NormalFirstName4','NormalLastName4','FromnoWhere4','CityofLight4','0')
INSERT INTO tbCategory -- 4 categories
(Name,ImagePath) values
('Tshirt','tshirt.jpg'),
('Ladies & Junior','Ladies&Junior.jpg'),
('Hoodies & Sweatshirts','Hoodies.jpg'),
('Polos','Polos.jpg')
INSERT INTO tbProduct  -- 6 products in category one, 3 products in category two, 1 in category three
(Name,Price,PrimaryImagePath,CategoryID) values
('Gildan Ultra Cotton Tshirt',10.99,'GildanUltraCotton.jpg',1),
('Anvil Jersey Tshirt',20.22,'AnvilJerseyTshirt.jpg',1),
('American Apparel Jersey Tshirt',32.22,'AmericanApparelJerseyTshirt.jpg',1),
('gildan 100% cotton',59.99,'gildan100%cotton.jpg',1),
('Jerzees',22.50,'Jerzees.jpg',1),
('Hanes TagLess Tshirt',99.99,'HanesTagLessTshirt.jpg',1),

('Augusta Youth Girls Vneck',22.33,'AugustaYouthGirlsVneck.jpg',2),
('Bella Youth CrewNeck',22.33,'BellaYouthCrewNeck.jpg',2),
('Bella Youth Tank',39.99,'BellaYouthTank.jpg',2),

('Sport-TekColor Block PerFormance Hooded Sweatshirt',123.99,'Sport-TekColorBlockPerFormanceHoodedSweatshirt.jpg',3)


INSERT INTO tbOrder    -- 3 example orders from the non-admins
(OrderDate,PricePaid,CustomerID) values
('12/29/2015',10.99,2),
('12/22/2015',10.99,3),
('12/20/2015',32.22,4)
INSERT INTO tbOrderDetail -- one item on the first order, 3 items on the second order, 2 items on the third order
(Quantity,SubTotal,OrderID,ProductID) values
(1,10.99,1,1),
(3,32.97,2,1),
(2,64.44,3,3)

-- NOTE: All Insert procs *MUST* return the new identity number of the primary key.
-- Example: if you use spInsertCategory after there are 4 categories, it should return the value 5.
-- If a procedure says: ByID, it means return ALL rows in the table if an ID is not supplied (ISNULL)
go
--procedure for gettingcategorybyid
create procedure spGetCategoryByID
(
@CategoryID int = null
)
as begin
select tbCategory.ID, Name,'./Images/'+ImagePath as 'ImagePath' from tbCategory 
where CategoryID = @CategoryID
end
go
--
spInsertCategory
spDeleteCategory
spUpdateCategory

spLogin
spGetCustomerByID
spInsertCustomer
spDeleteCustomer
spUpdateCustomer

spGetProductsByCategoryID
spGetProductByID
spInsertProduct
spDeleteProduct
spUpdateProduct

spGetOrderByID
spInsertOrder
spDeleteOrder
spUpdateOrder

spGetOrderDetailByID
spInsertOrderDetail
spDeleteOrderDetail
spUpdateOrderDetail
spGetOrderAndDetailsByOrderID -- Show all Details based on the OrderID


-- Create these reports:
1. Top 3 Customers for TOTAL spent among all orders
2. Show each category and how many products are available in each
3. Show the products listed by total amount paid (take into consideration quantity & price)
