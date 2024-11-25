select distinct a.id from Weather a ,Weather b
where a.id != b.id
and a.temperature  > b.temperature
and datediff(a.recordDate , b.recordDate) = 1