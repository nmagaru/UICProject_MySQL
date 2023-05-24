SELECT country_table.country, COUNT(news.country_id) AS articleCount
FROM news
RIGHT JOIN country_table ON country_table.country_id = news.country_id
GROUP BY country_table.country_id
ORDER BY articleCount DESC;
