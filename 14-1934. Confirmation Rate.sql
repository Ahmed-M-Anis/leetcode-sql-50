select Signups.user_id ,         
round(   
    CASE 
        WHEN COUNT(CASE WHEN Confirmations.action = 'confirmed' THEN 1 END) = 0 THEN 0
        ELSE  COUNT(CASE WHEN Confirmations.action =  'confirmed' THEN 1 END) 
        /CAST(COUNT(Confirmations.user_id) AS FLOAT) END 
    ,2)
AS confirmation_rate
from Signups
left join Confirmations 
on Signups.user_id = Confirmations.user_id
group by user_id