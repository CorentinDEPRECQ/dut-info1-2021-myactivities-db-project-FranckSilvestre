SELECT  title, description, username
FROM activity
LEFT JOIN "user"
ON owner_id = "user"."id"
WHERE creation_date < '2019-09-01'
ORDER BY title, username
