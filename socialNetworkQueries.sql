-- Query 1 Comments containing 'lol'
SELECT * 
FROM comments
WHERE text LIKE '%lol%'
ORDER BY Poster DESC, Recipient ASC;

-- Query 2 Posters of one gender to Recipients of a different gender
SELECT DISTINCT c.Poster, c.Recipient, u.Gender
FROM comments c
JOIN user u ON c.Recipient = u.id
WHERE (SELECT Gender FROM user WHERE id = c.Poster) <> u.Gender;


-- Query 3 Comments from this year by name X or to name Y
SELECT c.CommentID, c.Poster, c.Recipient, c.Text, c.PostDate, u.Name
FROM comments c
JOIN user u ON c.Poster = u.id OR c.Recipient = u.id
WHERE (u.Name = 'Dyllan' AND c.Poster = u.id)
   OR (u.Name = 'Anne' AND c.Recipient = u.id)
   AND YEAR(c.PostDate) = YEAR(CURDATE());


-- Query 4 Number of friends by gender
SELECT f.Id1 AS Id, u.Gender, COUNT(*) AS Count
FROM Friends f
JOIN User u ON f.Id2 = u.Id
GROUP BY f.Id1, u.Gender;


-- Query 5 Users with no friends of the same gender
SELECT DISTINCT U.*
FROM USER U
WHERE NOT EXISTS (
    SELECT 1
    FROM Friends F
    JOIN USER U2 ON F.Id2 = U2.Id
    WHERE F.Id1 = U.Id AND U.Gender = U2.Gender
);


-- Query 6  Users with at least two friendships on the same date
SELECT * 
FROM USER 
WHERE ID IN (
    SELECT F.ID1  
    FROM FRIENDS AS F  
    JOIN FRIENDS AS D ON F.ID1 = D.ID1 AND F.STARTDATE = D.STARTDATE AND F.ID2 <> D.ID2
    GROUP BY F.ID1, F.STARTDATE  
    HAVING COUNT(*) > 1
);


-- Query 7 Users and number of friends if commented to at least 2 different users
SELECT DISTINCT U.*, F.ID2 
FROM USER U
JOIN FRIENDS F ON F.ID1 = U.ID
WHERE U.ID IN (
    SELECT C.Poster
    FROM COMMENTS C
    GROUP BY C.Poster
    HAVING COUNT(DISTINCT C.Recipient) >= 2
);



-- Query 8 Users who posted comments to all users of a specific gender ('M')
SELECT *  
FROM USER  
WHERE ID IN (
    SELECT Poster  
    FROM COMMENTS  
    WHERE Recipient IN (SELECT ID FROM USER WHERE Gender = 'M')  
    GROUP BY Poster  
    HAVING COUNT(DISTINCT Recipient) = (SELECT COUNT(*) FROM USER WHERE Gender = 'M')
);



-- Query 9 Users with the most friends
SELECT U.*
FROM USER U
WHERE ID IN (
    SELECT ID1
    FROM FRIENDS
    GROUP BY ID1
    HAVING COUNT(*) = (
        SELECT MAX(FriendCount)
        FROM (
            SELECT COUNT(*) AS FriendCount
            FROM FRIENDS
            GROUP BY ID1
        ) AS FriendCounts
    )
);
