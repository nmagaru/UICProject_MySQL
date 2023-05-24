SELECT title, DATE_FORMAT((STR_TO_DATE(publish_date, "%m/%d/%y")), "%M") AS Month
FROM news
ORDER BY STR_TO_DATE(publish_date, "%m/%d/%y") ASC;