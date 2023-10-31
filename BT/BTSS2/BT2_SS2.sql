CREATE DATABASE baitap2;
use baitap2;
create table if not exists Customer (
    Customer_id int not null primary key auto_increment,
    Customer_Name varchar(30),
    Customer_Age int
);
create table if not exists Oder(
    oder_id int not null primary key auto_increment,
    oder_date datetime,
    oder_TotalPrice float,
    Customer_id int,
    foreign key (  Customer_id) references Customer(Customer_id )
);
create table if not exists Product(
    product_id int not null primary key auto_increment,
    product_name varchar(30),
    product_price float
);
create table if not exists OderDetail(
    oder_id int,
    product_id int,
    oder_quantity int,
    primary key (oder_id,product_id),
    foreign key (oder_id) references Oder(oder_id),
    foreign key (product_id) references Product(product_id)
);