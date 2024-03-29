SELECT
    A.SD AS START_DATE,
    MIN(B.ED) AS END_DATE
FROM
    (
    SELECT
        A.START_DATE AS SD
    FROM
        PROJECTS AS A
    LEFT JOIN PROJECTS AS B
    ON A.START_DATE=B.END_DATE
    WHERE B.END_DATE IS NULL
    ) AS A,
    (
    SELECT
        B.END_DATE AS ED
    FROM
        PROJECTS AS A
    RIGHT JOIN PROJECTS AS B
    ON A.START_DATE=B.END_DATE
    WHERE A.START_DATE IS NULL
    ) AS B
WHERE
    A.SD<B.ED
GROUP BY
    A.SD
ORDER BY
    DATEDIFF(MIN(B.ED), START_DATE),
    A.SD
;                         