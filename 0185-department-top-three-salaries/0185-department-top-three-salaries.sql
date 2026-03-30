select d.name as Department , e.name as Employee, e.salary as salary from 
    (select departmentId ,name ,salary, 
    dense_rank() over(partition by departmentId order by salary desc) as rk
    from Employee) e
    inner join Department d on d.id=e.departmentId
where e.rk<=3;