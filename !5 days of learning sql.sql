WITH daily AS (
    SELECT submission_date,hacker_id,COUNT(*) cnt
    FROM Submissions
    GROUP BY submission_date,hacker_id
),
rnk AS (
    SELECT *,
           ROW_NUMBER() OVER(
               PARTITION BY submission_date
               ORDER BY cnt DESC,hacker_id
           ) rn
    FROM daily
),
cons AS (
    SELECT submission_date,hacker_id
    FROM (
        SELECT submission_date,
               hacker_id,
               DENSE_RANK() OVER(PARTITION BY hacker_id ORDER BY submission_date) r
        FROM (
            SELECT DISTINCT submission_date,hacker_id
            FROM Submissions
        ) x
    ) y
    WHERE DATEDIFF(submission_date,'2016-03-01')+1=r
)
SELECT c.submission_date,
       COUNT(DISTINCT c.hacker_id),
       r.hacker_id,
       h.name
FROM cons c
JOIN rnk r
ON c.submission_date=r.submission_date
AND r.rn=1
JOIN Hackers h
ON r.hacker_id=h.hacker_id
GROUP BY c.submission_date,r.hacker_id,h.name
ORDER BY c.submission_date;
