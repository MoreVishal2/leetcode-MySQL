select pu.product_id product_id,
ifnull(round(sum(prised)/sum(units),2),0) as average_price 
from
(select p.product_id, p.price*u.units as prised, units from Prices p left join
UnitsSold u on p.product_id=u.product_id and u.purchase_date between start_date and end_date) pu
group by pu.product_id