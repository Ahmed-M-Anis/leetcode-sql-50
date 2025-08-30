select p.product_id , 
    COALESCE(round((sum(CASE 
        WHEN u.purchase_date BETWEEN p.start_date AND p.end_date
        THEN u.units * p.price else 0
    END))/ SUM(
        CASE 
            WHEN u.purchase_date BETWEEN p.start_date AND p.end_date
            THEN u.units
        END
    ) ,2)
     ,0) AS average_price
 from Prices p
 left join UnitsSold u
    on p.product_id = u.product_id
 group by p.product_id