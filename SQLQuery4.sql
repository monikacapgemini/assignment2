create table Product
(
id int NOT NULL PRIMARY KEY,
productname nvarchar(50),
unitprice decimal(12,2),
package nvarchar(30) NOT NULL,
isdiscontinued bit
);

create table orderitem
(
id int PRIMARY KEY,
orderid int ,
productid int ,
unitprice decimal(12,2),
quantity int
);

create table Orde
(
id int PRIMARY KEY,
Orderdate datetime NOT NULL,
Ordernumber nvarchar(10),
customerid int ,
totalamount decimal(12,2)
);

create table customer
(
id int PRIMARY KEY,
firstname nvarchar(40),
lastname nvarchar(40),
city nvarchar(40),
country nvarchar(40),
phone nvarchar(20)
);

alter table orde add constraint orde_customerid_fk
foreign key(customerid) references customer(id)

alter table orderitem add constraint orderitem_orderid_fk
foreign key(orderid) references Orde(id)

alter table orderitem add constraint orderitem_productid_fk
foreign key(productid) references Product(id)

insert into Product (id,productname,unitprice,package,supply) values (1,'exotic',45,'ship','exotic liquids');
insert into Product (id,productname,unitprice,package,supply) values (2,'shampoo',97,'ship','clinic plus');
insert into Product (id,productname,unitprice,package,supply) values (3,'soap',35,'bus','medimix');
insert into Product (id,productname,unitprice,package,supply) values (4,'oil',100,'container','parachuute');
alter table orderitem add constraint orderitem_orderid_fk
foreign key(orderid) references Orde(id)
insert into Product (id,productname,unitprice,package,supply) values(1,'exotic',45,'ship','exotic liquids');
select * from Product

Alter table orderitem add constraint orderitem_orderid_fk
foreign key(orderid) references orde(id) 
Alter table orderitem add constraint orderitem_productid_fk
foreign key(productid) references Product(id)
Alter table orde add constraint orde_customerid_fk
foreign key(customerid) references customer(id)

insert into Product (id,productname,unitprice,package,isdiscontinued,supply) values (1,'liquid oxygen',89,'container',1,'exotic liquids');
insert into Product (id,productname,unitprice,package,isdiscontinued,supply) values (2,'chai',25,'container',1,'taj mahal');
insert into Product (id,productname,unitprice,package,isdiscontinued,supply) values (3,'shampoo',30,'ship',1,'clinic plus');
insert into Product (id,productname,unitprice,package,isdiscontinued,supply) values (4,'soap',89,'bus',0,'rexona');
select * from Product;
insert into Product(id,productname,unitprice,package,isdiscontinued,supply,categoryname) values (7,'fish',32,'container',1,'licious','seafood');
select * from Product;
insert into customer (id,firstname,lastname,city,country,phone,faxnumber) values (1,'Ron','radison','london','USA',0300074321,202234166);
insert into customer (id,firstname,lastname,city,country,phone,faxnumber) values (2,'Robert','radison','beckton','germany',0300074321,204545767);
insert into customer (id,firstname,lastname,city,country,phone,faxnumber) values (3,'sara','radcliff','london','USA',9912226800,304568927);
insert into customer (id,firstname,lastname,city,country,phone,faxnumber) values (4,'simran','cannon','hyderabad','India',9912226800,304568927);
select * from customer;
insert into customer (id,firstname,lastname,city,country,phone,faxnumber) values (5,'jimin','park','cambridge','germany',6300721559,null);
insert into customer (id,firstname,lastname,city,country,phone,faxnumber) values (6,'Adison','ruffet','losangles','USA',7036244624,304568926);
insert into orde(id,orderdate,ordernumber,customerid,shipname,totalamount) values (1,1999-02-15,142,1,'la corne dabondance',4000);
insert into orde(id,orderdate,ordernumber,customerid,shipname,totalamount) values (2,1999-02-25,143,2,'la corne dabondance',5000);
insert into orde(id,orderdate,ordernumber,customerid,shipname,totalamount) values (3,2000-06-30,144,3,'chitti',3000);
insert into orde(id,orderdate,ordernumber,customerid,shipname,totalamount) values (4,2000-09-19,145,4,'ramakrishna',2000);
insert into orde(id,orderdate,ordernumber,customerid,shipname,totalamount) values (6,1901-09-19,146,5,'ramakrishna',1500);

insert into orderitem(id,orderid,productid,unitprice,quantity) values (1,1,1,35,45);
insert into orderitem(id,orderid,productid,unitprice,quantity) values (2,2,2,55,86);
insert into orderitem(id,orderid,productid,unitprice,quantity) values (3,3,3,23,47);
insert into orderitem(id,orderid,productid,unitprice,quantity) values (4,4,4,32,97);
insert into orderitem(id,orderid,productid,unitprice,quantity) values (5,5,5,22,87);
insert into orderitem(id,orderid,productid,unitprice,quantity) values (6,6,6,33,68);

select * from Product;
select * from orderitem;
select * from orde;
select * from customer;
insert into Product(id,productname,unitprice,package,isdiscontinued,supply) values (5,'oil',15,'ship',0,'parachute');
insert into Product(id,productname,unitprice,package,isdiscontinued,supply) values (6,'coffee',45,'container',1,'bru');
select country from customer where firstname like 'A%';
select firstname from customer where firstname like '__i%';
select * from customer where country='germany';
select firstname +''+ lastname as customername from customer;
select * from customer where faxnumber is not null;
select * from customer where firstname like '-u%';
select * from orderitem where unitprice between 10 and 20;
select * from orde ORDER BY orderdate;
select * from Product where supply='exotic liquids';
select avg(quantity)as avgquantity from orderitem GROUP BY productid;
select shipname,shippingcompany from orde;
select * from orde where shipname='la corne dabondance' and orderdate between '1902-06-12' and '1905-06-30';
select * from orde
full join customer
on orde.customerid=customer.id
where phone= '300074321';
select * from customer;
select * from Product where categoryname='seafood';
select * from employee;
select * from employee where manager is not null;
select * from customer;
select orders from customer where country != 'london';
select * from customer where orders='chai';
select empname,deptname,rating from employee;
select * from employee ORDER BY joindate ASC;
select * from employee ORDER BY joindate DESC;
select productname,unitprice from Product ORDER BY unitprice DESC;
select productname,unitprice from Product ORDER BY unitprice ASC;
select * from products;
select productname,unitonorder,unitinstock from products where (((isdiscontinued)='true') and ((unitinstock)<unitonorder));
select productname,package,supply from Product
full join orderitem
on Product.id = orderitem.productid
where quantity=0;
select category,suppliers from products where category= products.category;
select orderid,orderdate,firstname,lastname,city,country from customer
full join orde
on orde.customerid=customer.id;
select * from orderitem;
select customerid,count(distinct orderid) as totalorders,
max(totalamount) as totalamount
from orde
group by customerid
order by 2 desc;
select distinct firstname,lastname
from customer
where substring(firstname,len(firstname)-1,2)='ra';
select shippingcompany,SUBSTRING(shippingcompany,1,1) as firstword from orde;
select * from Product;
select productname,category,priceafterdis from products,orderitem where products.id=orderitem.productid;
select shippingcompany,totalamount from orde,products where supply='exotic liquids' and totalamount>50;
select * from orde;
select shippingcompany,totalamount,Supply from orde where Supply='exotic liquids' and totalamount>50;
SELECT * FROM CUSTOMER;
