SELECT COUNT(likes.id) AS likes_count
FROM likes
WHERE (likes.media_id in (
    SELECT media.id
    FROM media
    WHERE media.user_id in (
        SELECT *
        FROM ( /*Как не дублировать эту часть запроса? */
                 SELECT users.id
               FROM users
                          LEFT JOIN profiles p on users.id = p.user_id
                 ORDER BY p.birthday DESC
                 LIMIT 10) as t)))
   OR (likes.post_id in (
    SELECT posts.id
    FROM posts
    WHERE posts.user_id in (
        SELECT *
        FROM (
                 SELECT users.id
                 FROM users
                          LEFT JOIN profiles p on users.id = p.user_id
                 ORDER BY p.birthday DESC
                 LIMIT 10) as t)))
   OR (likes.message_id in (
    SELECT messages.id
    FROM messages
    WHERE messages.from_user_id in (
        SELECT *
        FROM (
                 SELECT users.id
                 FROM users
                          LEFT JOIN profiles p on users.id = p.user_id
                 ORDER BY p.birthday DESC
                 LIMIT 10) as t)));