
SELECT DISTINCT f1.X, f1.Y
FROM Functions f1 JOIN Functions f2 ON f1.X=f2.Y AND f1.Y=f2.X
WHERE (f1.X<f1.Y) OR (f1.X=f1.Y AND (SELECT COUNT(*) FROM Functions WHERE X=f1.X AND Y=f1.Y)>1)
ORDER BY f1.X;
