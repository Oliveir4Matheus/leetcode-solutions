# Write your MySQL query statement below
WITH OrdersCompany AS (
    SELECT
        o.order_id,
        o.sales_id,
        c.name
    FROM
        Orders AS o
    LEFT JOIN
        Company as c
    ON
        o.com_id = c.com_id
)

SELECT
    sp.name
FROM
    SalesPerson AS sp
LEFT JOIN
    OrdersCompany AS co
ON
    sp.sales_id = co.sales_id
GROUP BY
    sp.name
HAVING
    SUM(CASE WHEN co.name = 'RED' THEN 1 ELSE 0 END) = 0
