--1st task
create database lab4;

--2nd task
create table warehouses(
    code serial,
    location varchar(255),
    capacity integer
);

create table boxes(
    code char(4),
    contents varchar(255),
    value real,
    warehouse integer
);


--3rd task
insert into warehouses (location, capacity) values
    ('Chicago', 3),
    ('Chicago', 4),
    ('New York', 7),
    ('Los Angeles', 2),
    ('San Francisco', 8);

insert into boxes values
    ('0MN7', 'Rocks', 180, 3),
    ('4H8P', 'Rocks', 250, 1),
    ('4RT3', 'Scissors', 190, 4),
    ('7G3H', 'Rocks', 200, 1),
    ('8JN6', 'Papers', 75, 1),
    ('8Y6U', 'Papers', 50, 3),
    ('9J6F', 'Papers', 175, 2),
    ('LL08', 'Rocks', 140, 4),
    ('P0H6', 'Scissors', 125, 1),
    ('P2T6', 'Scissors', 150, 2),
    ('TU55', 'Papers', 90, 5);

--4th task
select * from warehouses;

--5th task
select * from boxes where value > 150;

--6th task
select distinct on (contents) * from boxes;

--7th task
select warehouse, count(*)
from boxes
group by warehouse;

--8th task
select warehouse, count(*)
from boxes
group by warehouse
having count(*) > 2;

--9th task
insert into warehouses (location, capacity)
values ('New York', 3);

--10th task
insert into boxes
values ('H5RT', 'Papers', 200, 2);

--11th task
update boxes
set value = value * 0.85
where code = (select distinct on(value) code
              from boxes
              order by value desc
              limit 1 offset 2);

--12th task
delete from boxes where value < 150;

--13th task
delete from boxes
where warehouse in (select code
                    from warehouses
                    where location = 'New York')
returning *;



