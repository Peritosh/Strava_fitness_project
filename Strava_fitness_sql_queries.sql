----------------------------------
-- SQl Queries for Strava Fitness
----------------------------------

-- Query 01
-- Total Number of Users

SELECT COUNT(DISTINCT Id) AS total_users
FROM dailyactivity;

-- Query 02
-- Average Daily Steps

SELECT AVG(TotalSteps) AS avg_daily_steps
FROM dailyactivity;

-- Query 03
-- Most Active Users

SELECT Id, AVG(TotalSteps) AS avg_steps
FROM dailyactivity
GROUP BY Id
ORDER BY avg_steps DESC
LIMIT 10;

-- Query 04
-- Average Activity Minutes

SELECT 
AVG(VeryActiveMinutes) AS avg_very_active,
AVG(FairlyActiveMinutes) AS avg_fairly_active,
AVG(LightlyActiveMinutes) AS avg_light_active,
AVG(SedentaryMinutes) AS avg_sedentary
FROM dailyactivity;

-- Query 05
-- Average Steps by Day of Week

SELECT DayOfWeek, AVG(TotalSteps) AS avg_steps
FROM dailyactivity
GROUP BY DayOfWeek
ORDER BY avg_steps DESC;

-- Query 06
-- Calories Burned vs Steps

SELECT 
AVG(TotalSteps) AS avg_steps,
AVG(Calories) AS avg_calories
FROM dailyactivity;

-- Query 07
-- Average Sleep Duration

SELECT AVG(TotalMinutesAsleep) AS avg_sleep_minutes
FROM sleepday;

-- Query 08
-- Activity vs Sleep

SELECT 
a.Id,
AVG(a.TotalSteps) AS avg_steps,
AVG(s.TotalMinutesAsleep) AS avg_sleep
FROM dailyactivity a
JOIN sleepday s
ON a.Id = s.Id
GROUP BY a.Id;

-- Query 09
-- Users Who Log Weight

SELECT COUNT(DISTINCT Id) AS users_logging_weight
FROM weightloginfo;

-- Query 10
-- Average BMI of Users

SELECT AVG(BMI) AS avg_bmi
FROM weightloginfo;
