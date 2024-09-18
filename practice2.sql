--1st task
create database lab2;

--2nd task
create table countries(
    country_id serial PRIMARY KEY,
    country_name varchar(100),
    region_id integer,
    population integer
);

--3rd task
insert into countries (country_name, region_id, population)
values ('Kazakhstan', 3, 785000);

--4th task
insert into countries (country_name)
values ( 'Russia');

--5th task
insert into countries (country_name, region_id, population)
values ('China', NULL, 35000000);

--6th task
insert into countries (country_name, region_id, population)
values ('USA', 10, 2450000),
       ( 'France', 2, 430000),
       ( 'South Korea', 8, 800000);

--7th task
alter table countries
    alter column country_name set default 'Kazakhstan';

--8th task
insert into countries (country_name, region_id, population)
values ( default, 2, 2000000);

--9th task
insert into countries default values;

--10th task
create table countries_new (like countries);


select * from countries;

