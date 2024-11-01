SELECT q.query_name,
ROUND(AVG(q.rating::numeric/q.position),2) AS quality,
ROUND(
        COUNT(CASE WHEN q.rating < 3 THEN 1 END) * 100.0 / COUNT(*), 
        2
    ) AS poor_query_percentage
FROM Queries q
WHERE q.query_name IS NOT NULL
GROUP BY q.query_name