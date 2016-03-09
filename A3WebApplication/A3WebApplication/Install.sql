-- 30 MARKS TOTAL

-- TODO: Database

-- Complete these tables (3 marks), 
-- inserts (1 mark) 
-- stored procedures (20 marks total)
-- reports (6 marks)
use master
go
drop database dbAssignment03
go
create database dbAssignment03
go
use dbAssignment03
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
AccessLevel bit -- admin = 1 & not admin = 0
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
Price decimal(7,2),
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
('NormalUser1','NormalUserPass1','NormalFirstName1','NormalLastName1','FromnoWhere1','CityofLight1',111-111-1111,'0'),
('NormalUser2','NormalUserPass2','NormalFirstName2','NormalLastName2','FromnoWhere2','CityofLight2',222-222-2222,'0'),
('NormalUser3','NormalUserPass3','NormalFirstName3','NormalLastName3','FromnoWhere3','CityofLight3',333-333-3333,'0'),
('NormalUser4','NormalUserPass4','NormalFirstName4','NormalLastName4','FromnoWhere4','CityofLight4',444-444-4444,'0')
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
create procedure spGetCategoriesByID
(
@CategoryID int = null
)
as begin
select tbCategory.CategoryID, Name,'./Images/'+ImagePath as 'ImagePath' from tbCategory 
where CategoryID = @CategoryID
end
go
--inserting to category
create procedure spInsertCategory
(
@CategoryID int = null,
@Name varchar(max) = null,
@ImagePath varchar(max) = null
)
as begin
insert into tbCategory(Name,ImagePath)values
(@Name,ISNULL(@ImagePath,'no_image_available.png'))
select SCOPE_IDENTITY() as 'NewCatID'
end
go
-- deleting a category proc
create procedure spDeleteCategory
(
@CategoryID int = null
)
as begin
delete from tbCategory where CategoryID=@CategoryID
end
go
-- updating category
create procedure spUpdateCategory
(
@CategoryID int = null,
@Name varchar(max) = null,
@ImagePath varchar(max) = null
)
as begin
update tbCategory set Name = @Name,
                      ImagePath = ISNULL(@ImagePath,ImagePath)
end
go
-- get login info
create procedure spLogin
(
@UserName varchar(max),
@Password varchar(max)
)
as begin
select * from tbCustomer where UserName = @UserName and Password = @Password
end
go
-- selecting customerbyid 
create procedure spGetCustomerByID
(
@CustomerID int = null
)
as begin
select * from tbCustomer where CustomerID = @CustomerID
end
go
-- insert customer // register
create procedure spInsertCustomer
(
@CustomerID int = null,
@UserName varchar(max),
@Password varchar(max),
@FirstName varchar(max),
@LastName varchar(max),
@Address varchar(max),
@City varchar(max),
@PhoneNumber int,
@AccessLevel bit
)
as begin
insert into tbCustomer(UserName,Password,FirstName,LastName,Address,City,PhoneNumber,AccessLevel) values
(@UserName,@Password,@FirstName,@LastName,@Address,@City,@PhoneNumber,@AccessLevel)
select SCOPE_IDENTITY() as 'NewCustomerID'
end
go
-- deleting customer
create procedure spDeleteCustomer(
@CustomerID int = null
)
as begin
delete from tbCustomer where CustomerID = @CustomerID
end
go
-- updating customer
create procedure spUpdateCustomer
(
@CustomerID int = null,
@UserName varchar(max),
@Password varchar(max),
@FirstName varchar(max),
@LastName varchar(max),
@Address varchar(max),
@City varchar(max),
@PhoneNumber int,
@AccessLevel bit
)
as begin
update tbCustomer set

UserName = @UserName,
Password = @Password,
FirstName = @FirstName,
LastName = @LastName,
Address = @Address,
City = @City,
PhoneNumber = @PhoneNumber,
AccessLevel = @AccessLevel
end
go
-- joinging the catid to prodid and getting the info
create procedure spGetProductsByCategoryID
(
@ProductID int = null,
@Name varchar(max)= null,
@Price decimal(7,2)=null,
@PrimaryImagePath varchar(max)=null,
@CategoryID int=null,
@ProductName varchar(max)=null,
@ImagePath varchar(max)=null
)
as begin
select tbCategory.CategoryID,tbCategory.Name,Price,PrimaryImagePath,tbProduct.ProductID,tbProduct.Name,ImagePath 
from tbProduct join tbCategory on tbCategory.CategoryID = tbProduct.CategoryID
order by tbCategory.CategoryID
end
go

create procedure spGetProductByID
(
@ProductID int = null
)
as begin
Select * from tbProduct where ProductID=@ProductID
end
go
-- inserting product 
create procedure spInsertProduct
(
@ProductID int = null,
@Name varchar(max) = null,
@Price decimal(7,2) = null,
@PrimaryImagePath varchar(max)=null,
@CategoryID int = null
)
as begin
insert into tbProduct (Name,Price,PrimaryImagePath,CategoryID)values
(@Name,@Price,isnull(@PrimaryImagePath,'no_image_available.png'),@CategoryID)
select SCOPE_IDENTITY() as 'NewProdID'
end
go
-- deleting  product
create procedure spDeleteProduct
(
@ProductID int = null
)
as begin
delete from tbProduct where ProductID = @ProductID
end
go
-- updating product 
create procedure spUpdateProduct
(
@ProductID int = null,
@Name varchar(max) = null,
@Price decimal(7,2) = null,
@PrimaryImagePath varchar(max)=null,
@CategoryID int = null
)
as begin
update tbProduct set 
Name = @Name,
Price = @Price,
PrimaryImagePath = @PrimaryImagePath,
CategoryID = @CategoryID
end
go

create procedure spGetOrderByID
(
@OrderID int =null
)
as begin
select * from tbOrder where OrderID = @OrderID
end
go
create procedure spInsertOrder
(
@OrderID int = null,
@OrderDate date=null,
@PricePaid decimal(7,2)=null,
@CustomerID int =null
)
as begin
insert into tbOrder (OrderID,OrderDate,PricePaid,CustomerID)values 
                    (@OrderID,@OrderDate,@PricePaid,@CustomerID)
select SCOPE_IDENTITY() as 'NewOrderID'
end
go

create procedure spDeleteOrder
(
@OrderID int = null
)
as begin
 delete from tbOrder where OrderID = @OrderID
end
go

create procedure spUpdateOrder
(
@OrderID int = null,
@OrderDate date=null,
@PricePaid decimal(7,2)=null,
@CustomerID int =null
)
as begin
update tbOrder set 
OrderDate = @OrderDate,
PricePaid = @PricePaid,
@CustomerID = @CustomerID
end
go
create procedure spGetOrderDetailByID
(
@OrderDetailID int =null,
@Quantity int=null,
@SubTotal decimal(7,2)=null,
@OrderID int =null,
@ProductID int =null
)
as begin
select OrderDetailID, Quantity,SubTotal,
tbProduct.ProductID,tbProduct.Name,tbProduct.Price,tbProduct.PrimaryImagePath,
tbOrder.OrderID,tbOrder.OrderDate,tbOrder.PricePaid
 from tbOrderDetail join tbProduct on 
tbProduct.ProductID = tbOrderDetail.ProductID join tbOrder on
 tbOrder.OrderID =tbOrderDetail.OrderID where tbOrderDetail.OrderDetailID = @OrderDetailID
end
go
create procedure spInsertOrderDetail
(
@OrderDetailID int =null,
@Quantity int=null,
@SubTotal decimal(7,2)=null,
@OrderID int =null,
@ProductID int =null
)
as begin
insert into tbOrderDetail(Quantity,SubTotal,OrderID,ProductID)values
                         (@Quantity,@SubTotal,@OrderID,@ProductID)
select SCOPE_IDENTITY() as 'NewOrderDetailID'
end
go

create procedure spDeleteOrderDetail
(
@OrderDetailID int = null
)
as begin
delete from tbOrderDetail where OrderDetailID = @OrderDetailID
end
go
create procedure spUpdateOrderDetail
(
@OrderDetailID int =null,
@Quantity int=null,
@SubTotal decimal(7,2)=null,
@OrderID int =null,
@ProductID int =null
)
as begin
update tbOrderDetail set
Quantity = @Quantity,
SubTotal = @SubTotal,
OrderID = @OrderID,
ProductID = @ProductID
where OrderDetailId = @OrderDetailID
end
go
create procedure spGetOrderAndDetailsByOrderID -- Show all Details based on the OrderID
(
@OrderDetailID int =null,
@Quantity int=null,
@SubTotal decimal(7,2)=null,
@OrderID int =null,
@ProductID int =null
)
as begin
select OrderDetailID,Quantity,SubTotal,tbOrder.OrderID,tbOrder.OrderDate
,tbOrder.PricePaid,tbOrder.CustomerID
 from tbOrderDetail join tbOrder on tbOrder.OrderID =
  tbOrderDetail.OrderID order by tbOrder.OrderID 
end
go


-- Create these reports:
-- 1. Top 3 Customers for TOTAL spent among all orders
select top 3 tbCustomer.FirstName,PricePaid,Quantity,SubTotal from tbOrderDetail join tbOrder on
 tbOrder.OrderID = tbOrderDetail.OrderID 
join tbCustomer on tbOrder.CustomerID = 
tbCustomer.CustomerID order by tbCustomer.CustomerID desc

--2. Show each category and how many products are available in each
select tbCategory.Name, COUNT(*) as 'product' from tbCategory  
 JOIN tbProduct on tbCategory.CategoryID = tbProduct.CategoryID 
 group by tbCategory.Name 

-- 3. Show the products listed by total amount paid (take into consideration quantity & price)
select Name, sum(Price * Quantity) as 'Total Amount' from tbProduct  
 JOIN tbOrderDetail ON tbProduct.ProductID = tbOrderDetail.ProductID  group by Name 
 order by [Total Amount] desc 


