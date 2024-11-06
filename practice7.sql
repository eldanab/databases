--1
create index idx_name on countries(name);

select * from countries where name = 'string';

--2
create index idx_first_last_name on employees(first_name, last_name);

select * from employees where first_name = 'string' and last_name = 'string';

--3
create unique index idx_salary on employees(salary);

select * from employees where salary < 85000 and salary > 70000;

--4
create index idx_employee_substr_name on employees( substring(first_name from 1 for 4));

select * from employees where substring(first_name from 1 for 4) = 'abcd';

--5
create index idx_budget on departments(budget);
create index idx_dep_id_salary on employees(department_id, salary);

select * from employees e
join departments d
on d.department_id = e.department_id
where d.budget > 500000 and e.salary < 80000;