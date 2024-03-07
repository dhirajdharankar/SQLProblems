select p.product_id, 
    ROUND(ISNULL((SUM(p.price * u.units) + 0.00)/ (SUM(u.units) + 0.00), 0), 2) as average_price
from prices p
LEFT OUTER join UnitsSold u on p.product_id = u.product_id and 
    p.start_date <= u.purchase_date and 
    p.end_date >= purchase_date
group by p.product_id 