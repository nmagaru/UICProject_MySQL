SELECT country, FORMAT((count/total) * 100, 3) AS avg_news_score
FROM country_table
INNER JOIN 
(SELECT table1.country_id, count, total
FROM
(SELECT country_id, SUM(news_guard_score) AS count
FROM news
GROUP BY country_id) as table1
JOIN
(SELECT country_id, COUNT(*)*100 AS total
FROM news
GROUP BY country_id) as table2
ON table1.country_id = table2.country_id) AS resultTable ON resultTable.country_id = country_table.country_id
ORDER BY CONVERT(avg_news_score, decimal) DESC, country ASC;