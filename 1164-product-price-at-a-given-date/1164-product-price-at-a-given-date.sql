select product_id , new_price as price from 
(select product_id,
        dense_rank() over(partition by product_id order by change_date desc) as rk,
        new_price
        from Products where change_date<="2019-08-16") pr where rk=1
union 

select product_id , 10 from products 
    where product_id not in (select product_id from products where change_date<="2019-08-16")