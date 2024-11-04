SELECT name AS results
FROM (
    SELECT COUNT(m.movie_id),u.name
    FROM MovieRating m,Users u
    WHERE m.user_id=u.user_id
    GROUP BY m.user_id,u.name
    ORDER BY COUNT(m.movie_id) DESC,u.name ASC
    LIMIT 1
)
UNION ALL
SELECT title AS results
FROM (
    SELECT AVG(mr.rating),mr.movie_id,m.title
    FROM MovieRating mr JOIN Movies m ON mr.movie_id=m.movie_id
    WHERE mr.created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY mr.movie_id,m.title
    ORDER BY AVG(mr.rating) DESC,m.title ASC
    LIMIT 1
)