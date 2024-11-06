--1
create database lab6;

--2
create table locations(
    location_id serial primary key ,
    street_address varchar(25),
    postal_code varchar(12),
    city varchar(30),
    state_province varchar(12)
);

create table departments(
    department_id serial primary key ,
    department_name varchar(50) unique ,
    budget integer,
    location_id integer references locations
);

create table employees(
    employee_id serial primary key,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50),
    phone_number varchar(20),
    salary integer,
    department_id integer references departments
);

INSERT INTO locations (street_address, postal_code, city, state_province) VALUES
('123 Elm St', '10001', 'New York', 'NY'),
('456 Oak St', '20002', 'Washington', 'DC'),
('789 Maple Ave', '30003', 'Atlanta', 'GA'),
('101 Pine St', '40004', 'Chicago', 'IL');

INSERT INTO departments (department_name, budget, location_id) VALUES
('Human Resources', 500000, 1),
('Sales', 800000, 2),
('Engineering', 1200000, 3),
('Marketing', 600000, 4),
('Finance', 900000, 2);

INSERT INTO employees (first_name, last_name, email, phone_number, salary, department_id) VALUES
('John', 'Doe', 'jdoe@example.com', '555-1234', 70000, 1),
('Jane', 'Smith', 'jsmith@example.com', '555-5678', 85000, 2),
('Alice', 'Johnson', 'ajohnson@example.com', '555-8765', 95000, 3),
('Bob', 'Brown', 'bbrown@example.com', '555-4321', 62000, 4),
('Charlie', 'Davis', 'cdavis@example.com', '555-1111', 78000, NULL),
('Evan', 'Miller', 'emiller@example.com', '555-3333', 80000, NULL),
('Grace', 'Kim', 'gkim@example.com', '555-4444', 69000, NULL);


--3
select e.first_name, e.last_name, e.department_id, d.department_name from employees e
join departments d on d.department_id = e.department_id;

--4
select e.first_name, e.last_name, e.department_id, d.department_name from employees e
join departments d on d.department_id = e.department_id
where e.department_id in (4, 8);

--5
select e.first_name, e.last_name, e.department_id, d.department_name, l.city, l.state_province from employees e
join departments d on e.department_id = d.department_id
join locations l on d.location_id = l.location_id;

--6
select * from departments d
left join employees e on d.department_id = e.department_id;

--7
select e.first_name, e.last_name, e.department_id, d.department_name from employees e
left join departments d on e.department_id = d.department_id;