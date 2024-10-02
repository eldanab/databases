--3rd task
select lastname from employees;

--4th task
select distinct lastname from employees;

--5th task
select * from employees where lastname = 'Smith';

--6th task
select * from employees where lastname = 'Smith' or lastname = 'Doe';

--7th task
select * from employees where department = 14;

--8th task
select * from employees where department in (14, 77);

--9th task
select sum(budget) from departments;

--10th task
select department, count(department) from employees group by department;

--11th task
select department
from (select department, count(department) as num_of_employees
      from employees
      group by department) as dept_count
where num_of_employees > 2;

--12th task
select name from departments
order by budget desc
limit 1 offset 1;

--13th task
select name, lastname from employees
where department = (select code
                    from departments
                    order by budget
                    limit 1);

--14th task
select name from employees where city = 'Almaty'
union
select name from customers where city = 'Almaty';

--15th task
select * from departments
where budget > 60000
order by budget, code desc;

--16th task
update departments
set budget = budget * 0.9
where code = (select code
                    from departments
                    order by budget
                    limit 1);

--17th task
update employees
set department = (select code from departments where name = 'IT')
where department = (select code from departments where name = 'Research');

--18th task
delete from employees
where department = (select code from departments where name = 'IT');

--19th task
delete from employees;



