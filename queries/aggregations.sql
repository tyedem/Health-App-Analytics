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

-- SUM query with JOIN on daily_calories

--CREATE VIEW `linear-freehold-354220.bellabeat.sum_activity_calories` AS
SELECT 
  daily_activity.Id,
  SUM(daily_calories.Calories) AS Calories,
  SUM(TotalSteps) AS TotalSteps,
  SUM(SedentaryMinutes) AS SedentaryMinutes,
  SUM(LightlyActiveMinutes) AS LightlyActiveMinutes,
  SUM(FairlyActiveMinutes) AS FairlyActiveMinutes,
  SUM(VeryActiveMinutes) AS VeryActiveMinutes
FROM 
  `linear-freehold-354220.bellabeat.daily_activity` AS daily_activity
JOIN
  `linear-freehold-354220.bellabeat.daily_calories` AS daily_calories
  ON
  daily_activity.Id=daily_calories.Id
GROUP BY 
  Id
ORDER BY 
  Calories DESC;

  -- Alternative ORDER BY view below:

  SELECT 
  daily_activity.Id,
  SUM(daily_calories.Calories) AS Calories,
  SUM(TotalSteps) AS TotalSteps,
  SUM(SedentaryMinutes) AS SedentaryMinutes,
  SUM(LightlyActiveMinutes) AS LightlyActiveMinutes,
  SUM(FairlyActiveMinutes) AS FairlyActiveMinutes,
  SUM(VeryActiveMinutes) AS VeryActiveMinutes
FROM 
  `linear-freehold-354220.bellabeat.daily_activity` AS daily_activity
JOIN
  `linear-freehold-354220.bellabeat.daily_calories` AS daily_calories
  ON
  daily_activity.Id=daily_calories.Id
GROUP BY 
  Id
ORDER BY 
  Id DESC

-- Observations: When comparing these query outputs, the FitBit appears to inconsistently collect data between the daily_activity and daily_calories tables. The SUMs of each variable in both tables do not match. There is no description as to how the data is collected for either of these tables. They both share the same date range and distinct IDs, thus data collection methods for these tables are questionable.

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
  Id DESC;

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

-- 18) weight_log_info


