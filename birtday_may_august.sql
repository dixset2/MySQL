SELECT name, birthday_at,
       CASE
           WHEN DATE_FORMAT (birthday_at, '%m') = 05 then 'may'
           WHEN DATE_FORMAT (birthday_at, '%m') = 08 then 'august'
           END AS Month
FROM users WHERE DATE_FORMAT (birthday_at, '%m') = 05 or DATE_FORMAT (birthday_at, '%m') = 08;