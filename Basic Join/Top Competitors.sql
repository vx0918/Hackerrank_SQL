SELECT
    A.HACKER_ID,
    A.NAME
FROM
    HACKERS AS A
INNER JOIN SUBMISSIONS AS B
ON A.HACKER_ID=B.HACKER_ID
INNER JOIN CHALLENGES AS C
ON B.CHALLENGE_ID=C.CHALLENGE_ID
INNER JOIN DIFFICULTY AS D
ON C.DIFFICULTY_LEVEL=D.DIFFICULTY_LEVEL
WHERE
    B.SCORE=D.SCORE
GROUP BY
    A.HACKER_ID,
    A.NAME
HAVING  
    COUNT(B.CHALLENGE_ID)>1
ORDER BY
    COUNT(B.CHALLENGE_ID) DESC,
    A.HACKER_ID
;