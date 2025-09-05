select query_name,
    round(avg(rating / position), 2) as quality,
    round(sum((case when rating < 3 then 100 else 0 end)) / count(query_name), 2) as            poor_query_percentage
    from queries q
    group by query_name