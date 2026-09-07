# Write your MySQL query statement below
WITH UserStats AS (
    SELECT
        user_id,
        COUNT(user_id) AS prompt_count,
        ROUND(AVG(tokens),2) AS avg_tokens
    FROM
        Prompts
    GROUP BY
        user_id
    HAVING
        COUNT(user_id) >= 3
)

SELECT DISTINCT
    us.user_id,
    us.prompt_count,
    us.avg_tokens
FROM
    UserStats AS us
WHERE EXISTS (
    SELECT
        1
    FROM
        Prompts AS p
    WHERE
        us.user_id = p.user_id AND p.tokens > us.avg_tokens
)
ORDER BY
    us.avg_tokens DESC, us.user_id
