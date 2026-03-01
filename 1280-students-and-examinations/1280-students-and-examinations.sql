select  st.student_id,st.student_name,sb.subject_name,ifnull(e.attended_exams,0) attended_exams from Students st 
cross join subjects sb 
left join (select student_id,subject_name,count(*) as attended_exams from examinations group by student_id,subject_name )e
on st.student_id=e.student_id
and sb.subject_name=e.subject_name
order by st.student_id,sb.subject_name;