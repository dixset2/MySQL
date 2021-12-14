SELECT IF(COUNT(women_profiles.user_id) > COUNT(men_profiles.user_id), 'women', 'men') AS who_more,
       COUNT(men_profiles.user_id) AS men_likes_count,
       COUNT(women_profiles.user_id) AS women_likes_count
FROM likes LEFT JOIN profiles men_profiles on likes.user_id = men_profiles.user_id AND men_profiles.gender = 'm'
           LEFT JOIN profiles women_profiles on likes.user_id = women_profiles.user_id AND women_profiles.gender = 'f';

SELECT IF((SELECT COUNT(id) FROM likes WHERE user_id in (SELECT user_id FROM profiles WHERE gender = 'm')) >
          (SELECT COUNT(id) FROM likes WHERE user_id in (SELECT user_id FROM profiles WHERE gender = 'f')), 'men', 'women') AS who_more;