--1
create database lab8;

--2
create table salesmen(
    salesman_id integer PRIMARY KEY,
    name varchar(200),
    city varchar(50),
    commission float
);

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
create role junior_dev with login;

--4
create view salesmen_new_york as
select *
from salesmen
where city = 'New York';

select * from salesmen_new_york;

--5
create view orders_s_a as
select o.order_no,
    o.purchase_amt,
    o.order_date,
    c.customer_name as customer,
    s.name as salesman
from orders o
join customers c on o.customer_id = c.customer_id
join salesmen s on o.salesman_id = s.salesman_id;

grant all privileges on orders_s_a to junior_dev;

select * from orders_s_a;

--6
create view customers_highest_grade as
select * from customers
where grade = (select max(grade) from customers);

grant select on customers_highest_grade to junior_dev;

select * from customers_highest_grade;

--7
create view cities_salesman_numbers as
select city, count(*) as number_of_salesmen from salesmen
group by city;

select * from cities_salesman_numbers;

--8
create view customer_per_salesmen as
select s.name, count(c.customer_id) from customers c
full outer join salesmen s on c.salesman_id = s.salesman_id
group by s.name
having count(c.customer_id) > 1;

select * from customer_per_salesmen;

--9
create role intern;
grant junior_dev to intern;
