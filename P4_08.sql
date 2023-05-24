SELECT publisher_table.publisher, FORMAT((count/total) * 100, 3) AS percentage
FROM publisher_table
INNER JOIN 
(SELECT table2.publisher_id, IFNULL(count, 0) AS count, total
FROM
(SELECT publisher_id, COUNT(*) AS count
FROM news
WHERE reliability = 1
GROUP BY publisher_id) as table1
RIGHT JOIN
(SELECT publisher_id, COUNT(*) AS total
FROM news
GROUP BY publisher_id) as table2
ON table1.publisher_id = table2.publisher_id) AS resultTable ON resultTable.publisher_id = publisher_table.publisher_id
ORDER BY CONVERT(percentage, decimal) DESC, publisher ASC;