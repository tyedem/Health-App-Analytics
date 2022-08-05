/* BigQuery:

Exploratory Aggregation Queries

*/

-- 1) daily_activity

--SUM queries

SELECT 
  Id,
  SUM(Calories) AS Calories,
  SUM(TotalSteps) AS TotalSteps,
  SUM(SedentaryMinutes) AS SedentaryMinutes,
  SUM(LightlyActiveMinutes) AS LightlyActiveMinutes,
  SUM(FairlyActiveMinutes) AS FairlyActiveMinutes,
  SUM(VeryActiveMinutes) AS VeryActiveMinutes
FROM 
  `linear-freehold-354220.bellabeat.daily_activity`
GROUP BY 
  Id
ORDER BY 
   Calories DESC;

-- Alternative ORDER BY view below:

SELECT 
  Id,
  SUM(Calories) AS Calories,
  SUM(TotalSteps) AS TotalSteps,
  SUM(SedentaryMinutes) AS SedentaryMinutes,
  SUM(LightlyActiveMinutes) AS LightlyActiveMinutes,
  SUM(FairlyActiveMinutes) AS FairlyActiveMinutes,
  SUM(VeryActiveMinutes) AS VeryActiveMinutes
FROM 
  `linear-freehold-354220.bellabeat.daily_activity`
GROUP BY 
  Id
ORDER BY 
   Id DESC

-- 2) daily_calories

--SUM queries

SELECT 
  Id,
  SUM(Calories) AS Calories
FROM 
  `linear-freehold-354220.bellabeat.daily_activity`
GROUP BY 
  Id
ORDER BY 
  Calories DESC;

-- 3) daily_intensities

--SUM queries

SELECT 
  Id,
  SUM(SedentaryMinutes) AS SedentaryMinutes,
  SUM(LightlyActiveMinutes) AS LightlyActiveMinutes,
  SUM(FairlyActiveMinutes) AS FairlyActiveMinutes,
  SUM(VeryActiveMinutes) AS VeryActiveMinutes
FROM 
  `linear-freehold-354220.bellabeat.daily_intensities`
GROUP BY 
  Id
ORDER BY 
   Id DESC

--Observations: The daily_intensities table appears consistent with the SUM of the daily_activity table without the join with daily_calories.

-- 4) daily_steps

--SUM queries

SELECT 
  Id,
  SUM(StepTotal) AS TotalSteps
FROM 
  `linear-freehold-354220.bellabeat.daily_steps`
GROUP BY
  Id
ORDER BY
  Id DESC

--Observations: The daily_intensities table appears consistent with the SUM of the daily_activity table without the join with daily_calories.

-- 5) heartrate_seconds

-- 6) daily_steps

-- 7) hourly_intensities

-- 8) hourly_steps

-- 9) minute_calories_narrow

-- 10) minute_calories_wide

-- 11) minute_calories_wide

-- 12) minute_intensities_wide

-- 13) minute_mets_narrow

-- 14) minute_sleep

-- 15) minute_steps_narrow

-- 16) minute_steps_wide

-- 17) sleep_day

--SUM query

SELECT
  Id,
  SUM(TotalSleepRecords) AS TotalSleepRecords,
  SUM(TotalMinutesAsleep) AS TotalMinutesAsleep,
  SUM(TotalTimeInBed) AS TotalTimeInBed
FROM
  `linear-freehold-354220.bellabeat.sleep_day`
GROUP BY
  Id
ORDER BY 
  TotalSleepRecords DESC;

-- Observations: MAX(TotalSleepRecords) = 39. MIN(TotalSleepRecords) = 1. There appears to be opportunity optimize the sleep records feature since 

SELECT
  Id,
  SUM(TotalSleepRecords) AS SumTotalSleepRecords
FROM
  `linear-freehold-354220.bellabeat.sleep_day`
GROUP BY
  Id
HAVING
  SumTotalSleepRecords >= 10
ORDER BY
  SumTotalSleepRecords DESC;

--Observations: There are only 15 users who have >= 10 TotalSleepRecords. About 60% of sampled users.

-- 18) weight_log_info


