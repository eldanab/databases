--1st task
create database lab1;

--2nd task
create table users (
    id serial,
    firstname varchar(50),
    lastname varchar(50)
);


--3rd task
alter table users add column
    isadmin integer;


--4th task
alter table users
    alter column isadmin type boolean using (isadmin = 1);


--5th task
alter table users
    alter column isadmin set default false;

--6th task
alter table users
    add constraint primary_key PRIMARY KEY(id);


--7th task
create table tasks(
    id serial,
    name varchar(50),
    user_id integer
);

--8th task
drop table tasks;

--9th task
drop database lab1;