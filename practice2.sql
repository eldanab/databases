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
create table countries_new (like countries including all);

--11th task
insert into countries_new select * from countries;

--12th task
update countries_new set region_id = 1 where region_id is null;

--13th task
select country_name, population * 1.1 as "New Population" from countries_new;

--14th task
delete from countries where population < 100000;

--15th task
delete from countries_new
       where country_id in (select country_id from countries)
       returning*;

--16th task
delete from countries returning*;

select * from countries_new;
select * from countries;

