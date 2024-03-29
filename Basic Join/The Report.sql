SELECT
    IF(B.GRADE>=8, A.NAME, NULL) AS N,
    B.GRADE,
    A.MARKS
FROM
    STUDENTS AS A
INNER JOIN GRADES AS B
ON A.MARKS BETWEEN B.MIN_MARK AND B.MAX_MARK
ORDER BY
    B.GRADE DESC,
    A.NAME,
    A.MARKS
;