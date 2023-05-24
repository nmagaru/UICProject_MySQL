SELECT month, numArticles, overall, FORMAT(((numArticles / overall) * 100), 3) AS percentage
FROM
(SELECT DATE_FORMAT((STR_TO_DATE(publish_date, "%m/%d/%y")), "%M") AS month, COUNT(*) AS numArticles, (SELECT COUNT(*) from news) AS overall
FROM news
GROUP BY DATE_FORMAT((STR_TO_DATE(publish_date, "%m/%d/%y")), "%M")
ORDER BY MONTH(STR_TO_DATE(publish_date, "%m/%d/%y")) ASC) AS table1
