select visited_on, amount, round(amount/7,2) as average_amount from (
        select visited_on, sum(amount) over(order by visited_on rows between 6 Preceding and current row) as amount
                ,count(amount) over(order by visited_on rows between 6 preceding and current row) as cnt
         from ( SELECT visited_on, SUM(amount) AS amount FROM Customer GROUP BY visited_on ) t_inner
) t_outer where cnt=7;