SELECT product_id,10 AS price
FROM Products 
GROUP BY product_id
HAVING MIN(change_date)>'2019-08-16'
UNION
SELECT p.product_id, p.new_price AS price
FROM Products p
WHERE p.change_date <= '2019-08-16'
  AND p.change_date = (
      SELECT MAX(p2.change_date)
      FROM Products p2
      WHERE p2.product_id = p.product_id
        AND p2.change_date <= '2019-08-16'
    );