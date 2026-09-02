SELECT
    W.id
FROM
    Weather AS w
INNER JOIN
    Weather AS wlj
ON
    DATEDIFF(w.recordDate,wlj.recordDate) = 1
WHERE
    w.temperature > wlj.temperature

