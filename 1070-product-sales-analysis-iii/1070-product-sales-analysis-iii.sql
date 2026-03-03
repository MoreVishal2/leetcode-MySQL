select  p.product_id product_id, p.year first_year, quantity, price from sales p
inner join 
(select product_id ,min(year) ye from Sales group by product_id) m 
on p.product_id=m.product_id and p.year=m.ye;