SELECT
	A.N,
	CASE
		WHEN A.P IS NULL THEN 'Root'
		WHEN A.N IN (SELECT A.N FROM BST AS A LEFT JOIN BST AS B ON A.N=B.P WHERE B.P IS NULL) THEN 'Leaf'
		ELSE 'Inner'
	END AS Type		
FROM BST AS A
ORDER BY
	A.N
;