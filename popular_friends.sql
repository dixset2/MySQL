SELECT id, email, phone, (SELECT CONCAT(firstname, ' ', lastname) FROM profiles WHERE user_id = users.id) fullname
FROM users
WHERE id in (
    SELECT max_messages_count_2.from_user_id
    FROM (
             SELECT messages.from_user_id, messages.to_user_id, MAX(messages_count) AS max_messages_count
             FROM (
                      SELECT from_user_id, to_user_id, COUNT(id) AS messages_count
                      FROM messages
                      WHERE to_user_id = 4
                        AND from_user_id in (SELECT IF(from_user_id = 4, to_user_id, from_user_id) AS friend_id
                                             FROM friendship_requests
                                     WHERE (from_user_id = 4 or to_user_id = 4) and status = 1)
                      GROUP BY from_user_id
                  ) messages) max_messages_count_2);