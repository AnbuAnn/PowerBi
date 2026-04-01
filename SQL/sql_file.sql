show databases;
create database healthcare_project;
use healthcare_project;
select * from claims;
-- Total Revenue
SELECT SUM(Approved_Amount) AS Total_Revenue
FROM claims;

-- Denial Rate
SELECT
count(CASE WHEN Claim_Status='Denied' THEN 1 END)*100.0 / COUNT(*) AS Denial_Rate
FROM claims;

-- Aging Summary
SELECT Aging_Bucket, SUM(Claim_Amount) AS Outstanding_Amount
FROM claims
GROUP BY Aging_Bucket
ORDER BY Aging_Bucket;

-- Top 5 Insurance with Highest Denial
SELECT Insurance_Provider,
COUNT(*) AS Total_Claims,
SUM(CASE WHEN Claim_Status='Denied' THEN 1 ELSE 0 END) AS Denied_Claims
FROM claims
GROUP BY Insurance_Provider
ORDER BY Denied_Claims DESC
LIMIT 5;

-- Monthly Revenue Trend
SELECT DATE_FORMAT(Submission_Date,'%Y-%m') AS Month,
SUM(Approved_Amount) AS Revenue
FROM claims
GROUP BY Month
ORDER BY Month;
