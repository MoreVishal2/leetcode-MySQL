select q1.query_name as query_name , round(avg(rating/position),2) as quality, 
round(ifnull(q2.bel3*100/count(q1.rating),0),2) as poor_query_percentage from Queries q1 left join
 (select query_name ,count(rating) bel3 from Queries where rating<3 group by query_name ) q2
on q1.query_name=q2.query_name group by q1.query_name;