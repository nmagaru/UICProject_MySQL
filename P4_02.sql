SELECT news_id, LENGTH(body_text) AS length 
FROM news 
WHERE LENGTH(body_text) > 100 
ORDER BY news_id ASC;