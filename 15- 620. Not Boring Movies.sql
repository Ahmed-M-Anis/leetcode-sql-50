select * from Cinema 
    WHERE ((cast(id as float)) % 2.0) != 0
    and description not like 'boring'
    order by rating desc