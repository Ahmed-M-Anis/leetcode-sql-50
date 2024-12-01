with new_table AS (
    select machine_id,process_id,activity_type , sum( timestamp ) as my_sum
    from Activity group by activity_type ,machine_id 
) 
select 
machine_id ,
round(((MAX(my_sum) - MIN(my_sum)) /2) ,3) as processing_time
from new_table 
group by new_table.machine_id