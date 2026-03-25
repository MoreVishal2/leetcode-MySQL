select distinct num as ConsecutiveNums from
(select lag(num) over(order by id) as pre,
        num,
        lead(num) over(order by id) as next from Logs) ta
where pre=num and num=next;