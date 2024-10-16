--1
create database lab5;

--2
create table customers(
    customer_id integer PRIMARY KEY,
    customer_name varchar(200),
    city varchar(50),
    grade integer,
    salesman_id integer references salesmen(salesman_id)
);

create table orders(
    order_no integer PRIMARY KEY,
    purchase_amt float,
    order_date date,
    customer_id integer references customers(customer_id),
    salesman_id integer references salesmen(salesman_id)
);

create table salesmen(
    salesman_id integer PRIMARY KEY,
    name varchar(200),
    city varchar(50),
    commission float
);

insert into salesmen values
                         (5001, 'James Hoog', 'New York', 0.15),
                         (5002, 'Nail Knite', 'Paris', 0.13),
                         (5005, 'Pit Alex', 'London', 0.11),
                         (5006, 'Mc Lyon', 'Paris', 0.14),
                         (5003, 'Lauson Hen', NULL, 0.12),
                         (5007, 'Paul Adam', 'Rome', 0.13);

insert into customers values
                          (3002, 'Nick Rimando', 'New York', 100, 5001),
                          (3005, 'Graham Zusi', 'California', 200, 5002),
                          (3001, 'Brad Guzan', 'London' , NULL, 5005),
                          (3004, 'Fabian Johns', 'Paris', 300, 5006),
                          (3007, 'Brad Davis', 'New York', 200, 5001),
                          (3009, 'Geoff Camero', 'Berlin', 100, 5003),
                          (3008, 'Julian Green', 'London', 300, 5002);

insert into orders values
                       (70001, 150.5, '2012-10-05', 3005, 5002),
                       (70009, 270.65, '2012-09-10', 3001, 5005),
                       (70002, 65.26, '2012-10-05', 3002, 5001),
                       (70004, 110.5, '2012-08-17', 3009, 5003),
                       (70007, 948.5, '2012-09-10', 3005, 5002),
                       (70005, 2400.6, '2012-07-27', 3007, 5001),
                       (70008, 5760, '2012-09-10', 3002, 5001);

--3
select sum(purchase_amt) from orders;

--4
select avg(purchase_amt) from orders;

--5
select count(customer_name)
from customers
where customer_name is not null;

--6
select min(purchase_amt) from orders;

--6(alternative way)
select purchase_amt
from orders
order by purchase_amt
limit 1;

--7
select * from customers
where customer_name like '%b';

--8
select * from orders
where customer_id in (select customer_id
                      from customers
                      where city = 'New York');

--8(alternative way)
select orders.* from orders
join customers on orders.customer_id = customers.customer_id
where customers.city = 'New York';

--9
select * from customers
where customer_id in (select customer_id
                      from orders
                      where purchase_amt > 10);

--9(alternative way)
select distinct customers.* from customers
join orders on customers.customer_id = orders.customer_id
where orders.purchase_amt > 10;

--10
select sum(grade) from customers;

--11
select * from customers
where customer_name is not null;

--12
select max(grade) from customers;

--12(alternative way)
select grade from customers
where grade is not null
order by grade desc
limit 1;