use sell_management;
create table Customer(
                         Customer_id int not null primary key  auto_increment,
                         Customer_name varchar(25),
                         Customer_Age tinyint


);
create table Orders(
                       Oder_id int not null  primary key  auto_increment,
                       Order_DateTime datetime,
                       Oder_TotalPrice int,
                       Customer_id int,
                       foreign key (Customer_id) references Customer(Customer_id)
);
create table Product(
                        Product_id int not null  primary key  auto_increment,
                        Product_name varchar(25),
                        Price int
);
create table OderDetail(
                           OderQuantity int,
                           Oder_id int,
                           Product_id int,
                           foreign key (Oder_id) references  Orders(Oder_id),
                           foreign key (Product_id) references Product(Product_id)
);
insert into Customer (Customer_name, Customer_Age) values ('nguyen van dung',31),('nguyen van huy',24), ('nguyen hong ha',25);
insert into Orders (Order_DateTime) values ('2023-11-02 14:30:00'),('2023-11-02 15:30:00'),('2023-11-03 15:30:00');
insert into Product (product_name, price) values ('Iphone 15 promax', 200), ('Samsung S23Ultra',300),('Xiaomi',350);

insert into OderDetail(OderQuantity,Oder_id,Product_id ) values (3,1,1),(7,1,3),(5,1,2);


# Hiển thị thông tin sản phẩm gồm mã oder, ngày oder, giá oder
update Orders as o
set o.Oder_TotalPrice = (
    SELECT SUM(od.OderQuantity * p.Price)
    FROM OderDetail od
             JOIN Product p ON od.Product_id = p.Product_id
    WHERE od.Oder_id = o.Oder_id);

select o.Oder_id, o.Order_DateTime, o.Oder_TotalPrice  from OderDetail as od
                                                                join Orders as o  on od.Oder_id = o.Oder_id;

select  c.Customer_name ,group_concat(' ',p.Product_name)  from Customer as c
                                                                    join  Orders as o on c.Customer_id = o.Customer_id
                                                                    join OderDetail as od on o.Oder_id = od.Oder_id
                                                                    join Product as p on od.Product_id = p.Product_id
group by c.Customer_id;

select distinct c.Customer_name from Customer as c
                                         join Orders as o on not c.Customer_id = o.Customer_id;

select o.Oder_id,
       o.Order_DateTime,
       (od.OderQuantity*p.Price) as 'tổng tiển/đơn'
from Orders as o
         join oderdetail as od on o.Oder_id = od.Oder_id
         join Product as p on od.Product_id = p.Product_id


