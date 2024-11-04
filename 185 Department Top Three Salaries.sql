SELECT d.name AS Department,
e.name AS Employee,
e.salary As Salary
FROM Employee e LEFT JOIN Department d ON e.departmentId=d.id
WHERE (e.salary,e.departmentId) IN(
    SELECT e3.salary,e3.departmentId
    FROM (SELECT e2.salary,e2.departmentId FROM Employee e2 WHERE e2.departmentId=e.departmentId)AS e3
    GROUP BY e3.salary,e3.departmentId
    ORDER BY e3.salary DESC
    LIMIT 3
)