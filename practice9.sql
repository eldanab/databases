--1
create function increase_value (p1 integer)
returns integer as
$$
    begin
        return p1 + 10;
    end;
$$
language plpgsql;

select increase_value(5);

--2
create function compare_values(p1 integer, p2 integer)
returns varchar as
$$
begin
        if p1 > p2 then return 'Greater';
        elsif p1 < p2 then return 'Less';
        else return 'Equal';
        end if;
end;
$$
language plpgsql;

select compare_values(10, 20);
select compare_values(10, 10);
select compare_values(20, 10);

--3
create or replace function number_series(n integer)
returns table(series integer) as
$$
declare
    i integer = 1;
begin
    for i in 1..n loop
        series = i;
        return next;
    end loop;
end;
$$
language plpgsql;

select number_series(5);

--4
create or replace function find_employee(name varchar)
returns table(id integer, employee_name varchar, employee_email varchar, employee_salary integer, number varchar, department integer)
as
$$
    begin
        return query
        select employee_id, first_name, email, salary, phone_number, department_id
        from employees
        where first_name = name;
    end;
$$
language plpgsql;

select * from find_employee('John');

--5
create or replace function list_products(category varchar)
returns table(id integer, name varchar, product_price numeric)
as
$$
    begin
        return query
        select p.product_id, p.product_name, p.price
        from products p
        join categories c on p.category_id = c.category_id
        where c.category_name = category;
    end;
$$
language plpgsql;

select * from list_products('Electronics');

--6
create or replace function calculate_bonus(salary float, percentage float)
returns float as
$$
    begin
        return salary * percentage;
    end;
$$
language plpgsql;


create or replace function update_salary(id integer)
returns float
as
$$
     declare
        current_salary float;
        bonus float;
    begin
        select salary into current_salary from employees where employee_id = id;
        bonus = calculate_bonus(current_salary, 0.15);
        update employees
         set salary = current_salary + bonus
         where employee_id = id;
        return current_salary + bonus;
    end;
$$
language plpgsql;

select update_salary(1);

--7
create or replace function complex_calculation(n1 integer, n2 integer, s1 varchar,  s2 varchar)
returns varchar as
$$
declare
    num_res integer;
    str_res varchar;
    result varchar;
begin
    begin
        num_res = n1 + n2;
    end;
    begin
        str_res := s1 || s2;
    end;
    result = 'Concatenation: ' || str_res || '; Sum: ' || num_res;
    return result;
END;
$$
LANGUAGE plpgsql;

select complex_calculation(1, 2, 'el', 'dana');
