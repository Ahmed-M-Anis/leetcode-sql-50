# Write your MySQL query statement below
select name from Employee where id in (
select e1.managerId from Employee e1
group by e1.managerId
HAVING COUNT(e1.managerId) >= 5
)