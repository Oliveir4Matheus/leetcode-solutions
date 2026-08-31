SELECT
    e.name AS Employee
FROM
    Employee AS e
INNER JOIN
    Employee AS e1
ON
    e.managerId = e1.id
WHERE e.salary > e1.salary
