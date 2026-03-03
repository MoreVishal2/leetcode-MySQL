select round(count(case when order_date=customer_pref_delivery_date then customer_id else null end)*100/count(customer_id),2) as immediate_percentage 
from
(select row_number() over(partition by customer_id order by order_date) as rk,customer_id, order_date, customer_pref_delivery_date from Delivery) d
where rk=1;