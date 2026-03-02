select id ,movie,description, rating from 
(select case when id%2!=0 then id else null end as id , movie , description, rating from Cinema where description!="boring" order by rating desc) d 
where id is not null;