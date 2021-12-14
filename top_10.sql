SELECT
    users.id,
    ( COALESCE(likes_count, 0) +
      COALESCE(communinities_count, 0) +
      COALESCE(media_count, 0) +
      COALESCE(messages_count, 0) +
      COALESCE(posts_count, 0) +
      COALESCE(friends_count, 0) )
        AS total
FROM users
         LEFT JOIN (
    SELECT user_id, COUNT(*) AS likes_count
    FROM likes
    GROUP BY user_id
) likes_count ON likes_count.user_id = users.id
         LEFT JOIN (
    SELECT user_id, COUNT(*) AS communinities_count
    FROM user_communities
    GROUP BY user_id
) communinities_count ON communinities_count.user_id = users.id
         LEFT JOIN (
    SELECT from_user_id,to_user_id, COUNT(*) AS messages_count
    FROM messages
) messages_count ON (messages_count.from_user_id = users.id or messages_count.to_user_id = users.id)
         LEFT JOIN (
    SELECT user_id, COUNT(*) AS media_count
    FROM media
    GROUP BY user_id
) media_count ON media_count.user_id = users.id
         LEFT JOIN (
    SELECT user_id, COUNT(*) AS posts_count
    FROM posts
    GROUP BY user_id
) posts_count ON posts_count.user_id = users.id
         LEFT JOIN (
    SELECT from_user_id,to_user_id,status, COUNT(*) AS friends_count
    FROM friendship_requests
) friends_count ON (friends_count.from_user_id = users.id or friends_count.to_user_id = users.id) and friends_count.status = 1
ORDER BY total ASC LIMIT 10