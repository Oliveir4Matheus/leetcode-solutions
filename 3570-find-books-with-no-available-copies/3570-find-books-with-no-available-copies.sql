# Write your MySQL query statement below
 SELECT
    lb.book_id,
    lb.title,
    lb.author,
    lb.genre,
    lb.publication_year,
    COUNT(br.book_id) AS current_borrowers
FROM
    library_books AS lb
INNER JOIN
    borrowing_records AS br
ON
    lb.book_id = br.book_id
AND
    br.return_date IS NULL
GROUP BY
    lb.book_id,
    lb.total_copies
HAVING
    lb.total_copies - COUNT(br.book_id) = 0
ORDER BY
    current_borrowers DESC, lb.title

