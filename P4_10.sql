SELECT author, political_bias, COUNT(*) AS numArticles
FROM
(SELECT author_table.author, news_authors.news_id, political_bias_table.political_bias
FROM author_table, news_authors, news, political_bias_table
WHERE author_table.author_id = news_authors.author_id
AND news_authors.news_id = news.news_id
AND news.political_bias_id = political_bias_table.political_bias_id
ORDER BY author_table.author) as table1
GROUP BY political_bias, author
ORDER BY author ASC, numArticles DESC, political_bias ASC
