# Write your MySQL query statement below
SELECT
    ti.employee_id
FROM (
    SELECT
        employee_id
    FROM
        Employees

    UNION

    SELECT
        employee_id
    FROM
        Salaries
) AS ti
LEFT JOIN
    Employees AS e
ON
    ti.employee_id = e.employee_id
LEFT JOIN
    Salaries AS s
ON
    ti.employee_id = s.employee_id
WHERE
    e.name IS NULL
OR
    COALESCE(s.salary,0) = 0

ORDER BY
    ti.employee_id
