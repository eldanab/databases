create database lab10;

create table books (
    book_id integer primary key,
    title varchar (50),
    author varchar (50),
    price decimal,
    quantity integer
);

create table orders(
    order_id integer primary key,
    book_id integer references books,
    customer_id integer references customers,
    order_date date,
    quantity integer
);

create table customers (
    customer_id integer primary key,
    name varchar(50),
    email varchar(50)
);

insert into books values
                      (1, 'Database 101', 'A.Smith', 40.00, 10),
                      (2, 'Learn SQL', 'B.Johnson', 35.00, 15),
                      (3, 'Advanced DB', 'C.Lee', 50.00, 5);

insert into customers values
                          (101, 'John Doe', 'johndoe@example.com'),
                          (102, 'Jane Doe', 'janedoe@example.com');

--1st task
begin;
insert into orders values (1, 1, 101, current_date, 2);
update books set quantity = quantity - 2 where book_id = 1;
commit;

--2nd task
do $$
declare
    available_quantity integer;
begin
    begin
        select quantity into available_quantity from books where book_id = 3;

        if available_quantity < 10 then
            raise notice 'not enough stock';
            rollback;
            return;
        end if;

        insert into orders values (2, 3, 102, CURRENT_DATE, 10);
        update books set quantity = quantity - 10 where book_id = 3;
        commit;
    end;
end $$;

--3rd task
begin;
set transaction isolation level read committed ;
update books set price = 45.00 where book_id = 1;
commit;

--4rd task
begin;
update customers set email = 'new@example.com' where customer_id = 101;
commit;




