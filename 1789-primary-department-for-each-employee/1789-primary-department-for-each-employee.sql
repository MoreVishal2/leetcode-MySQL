select employee_id, department_id from (
select employee_id,case when primary_flag="Y" then department_id else 
case when (count(*) over(partition by employee_id))=1 then department_id else null end  
end as department_id from Employee
) t
where department_id is not null;