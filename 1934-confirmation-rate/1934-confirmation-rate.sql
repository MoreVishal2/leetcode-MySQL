select s.user_id,round(ifnull(conf/req,0),2) as confirmation_rate 
from Signups s
left join 
    (select user_id,
    sum(case when action='confirmed' then 1 else 0 end) as conf,
     count(*) req from Confirmations 
     group by user_id ) c
on s.user_id=c.user_id
