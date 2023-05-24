SELECT publisher
FROM publisher_table
INNER JOIN news ON news.publisher_id = publisher_table.publisher_id
GROUP BY publisher
ORDER BY publisher ASC;