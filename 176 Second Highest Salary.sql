SELECT 
    CASE WHEN COUNT(DISTINCT salary)<2 THEN NULL
    ELSE(
        SELECT DISTINCT salary
        FROM Employee
        ORDER BY salary DESC
        OFFSET 1
        LIMIT 1
    )
    END AS SecondHighestSalary
FROM Employee