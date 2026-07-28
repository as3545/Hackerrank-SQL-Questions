/*
Enter your query here.
*/
SELECT Contests.contest_id, Contests.hacker_id, Contests.name,
SUM(IFNULL(Submission_Stats.total_submissions,0)),
SUM(IFNULL(Submission_Stats.total_accepted_submissions,0)),
SUM(IFNULL(View_Stats.total_views,0)), 
SUM(IFNULL(View_Stats.total_unique_views,0)) 
FROM Contests 
JOIN Colleges ON 
Contests.contest_id=Colleges.contest_id
JOIN Challenges ON 
Colleges.college_id=Challenges.college_id
LEFT JOIN (
    SELECT challenge_id,
           SUM(total_submissions) total_submissions,
           SUM(total_accepted_submissions) total_accepted_submissions
    FROM Submission_Stats
    GROUP BY challenge_id
) Submission_Stats
ON Challenges.challenge_id = Submission_Stats.challenge_id
LEFT JOIN (
    SELECT challenge_id,
           SUM(total_views) total_views,
           SUM(total_unique_views) total_unique_views
    FROM View_Stats
    GROUP BY challenge_id
) View_Stats
ON Challenges.challenge_id = View_Stats.challenge_id
GROUP BY  Contests.contest_id, Contests.hacker_id, Contests.name 
HAVING SUM(IFNULL(Submission_Stats.total_submissions,0))
+ SUM(IFNULL(Submission_Stats.total_accepted_submissions,0)) 
+ SUM(IFNULL(View_Stats.total_views,0))
+ SUM(IFNULL(View_Stats.total_unique_views,0)) > 0
ORDER BY Contests.contest_id;



