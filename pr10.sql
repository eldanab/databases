--2nd session 3rd task
begin;
set transaction isolation level read committed;
select price from books where book_id = 1;
commit;
