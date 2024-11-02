SELECT 'Low Salary' AS category, COUNT(CASE WHEN income<20000 THEN 1 END) AS accounts_count
FROM Accounts
UNION
SELECT 'High Salary' AS category, COUNT(CASE WHEN income>50000 THEN 1 END) AS accounts_count
FROM Accounts
UNION
SELECT 'Average Salary' AS category, COUNT(CASE WHEN income>=20000 AND income<=50000 THEN 1 END) AS accounts_count
FROM Accounts