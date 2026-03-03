select contest_id,round(count(user_id)*100/totUser,2) as percentage  from Register r cross join 
 (select count(user_id) as totUser from Users) u
 group by contest_id
 order by percentage desc,contest_id asc;