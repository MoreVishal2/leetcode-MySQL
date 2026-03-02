select pu.product_id product_id,
ifnull(round(sum(case when units is null then 0 else prised end)/sum(units),2),0) as average_price 
from
(select p.product_id, ifnull((p.price*u.units),0) as prised, units from Prices p left join
UnitsSold u on p.product_id=u.product_id and u.purchase_date between start_date and end_date) pu
group by pu.product_id