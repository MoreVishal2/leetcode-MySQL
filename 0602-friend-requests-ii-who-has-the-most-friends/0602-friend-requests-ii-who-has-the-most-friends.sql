select id, sum(cnt) as num from 
    (select requester_id as id, count(accepter_id ) as cnt from RequestAccepted group by requester_id
    union all
    select accepter_id , count(requester_id) from RequestAccepted group by accepter_id ) t
group by id order by num desc limit 1