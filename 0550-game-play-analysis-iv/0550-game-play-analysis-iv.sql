select round(count(case when datediff(event_date,ldate)=1 then player_id else null end)/count(distinct player_id),2) as fraction  
from
(select player_id ,event_date , min(event_date) over(partition by player_id order by event_date) as ldate from Activity) a;