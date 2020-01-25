# CREATE SCHEMA `friends` DEFAULT CHARACTER SET utf8 ;
# log into MySQL
# run source ./backup/friends.sql;

USE friends;

SELECT users.first_name, users.last_name, friend.first_name, friend.last_name
FROM users 
 JOIN friendships ON friendships.user_id = users.id 
 JOIN users as friend ON friendships.friend_id = friend.id;

# 1. Return all users who are friends with Kermit, make sure their names are displayed in results.

SELECT DISTINCT friend.first_name, friend.last_name
FROM users AS u JOIN friendships as f ON u.id = f.friend_id
    JOIN users AS friend ON f.user_id = friend.id
WHERE u.first_name = 'Kermit' OR friend.first_name = 'Kermit';

# 2. Return the count of all friendships

SELECT COUNT(*)
FROM friendships;

# 3. Find out who has the most friends and return the count of their friends.

SELECT u.first_name, u.last_name, COUNT(f.id) AS total
FROM friendships AS f JOIN users AS u ON (u.id = f.user_id OR u.id = f.friend_id)
GROUP BY u.first_name, u.last_name
ORDER BY total DESC
LIMIT 1;

# 4. Create a new user and make them friends with Eli Byers, Kermit The Frog, and Marky Mark

INSERT INTO users (first_name, last_name, created_at, updated_at) 
    VALUES ('Gonzalo', 'Huerta', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
    
INSERT INTO friendships (user_id, friend_id, created_at, updated_at)
    SELECT (SELECT id FROM users WHERE first_name = 'Gonzalo' AND last_name = 'Huerta'), u.id, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP
    FROM users AS u
    WHERE ( 
        (u.first_name = 'Eli' AND u.last_name = 'Byers') OR
        (u.first_name = 'Kermit' AND u.last_name = 'The Frog') OR
        (u.first_name = 'Marky' AND u.last_name = 'Mark')
	)
;

# 5. Return the friends of Eli in alphabetical order

SELECT friend.first_name, friend.last_name
FROM users AS u JOIN friendships AS f ON u.id = f.user_id
    JOIN users AS friend ON f.friend_id = friend.id
WHERE u.first_name = 'Eli'
ORDER BY friend.last_name ASC, friend.first_name ASC
;

# 6. Remove Marky Mark from Eli’s friends.

DELETE FROM friendships WHERE (
    user_id = (SELECT id FROM users WHERE first_name = 'Eli') AND
    friend_id = (SELECT id FROM users WHERE first_name = 'Marky' AND last_name = 'Mark')
);

# 7. Return all friendships, displaying just the first and last name of both friends
SELECT users.first_name, users.last_name, friend.first_name, friend.last_name
FROM users 
 JOIN friendships ON friendships.user_id = users.id 
 JOIN users as friend ON friendships.friend_id = friend.id;