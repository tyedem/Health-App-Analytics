/* Big Query

MIN/MAX datetime queries:

These queries were conducted during the Prepare phase of the project to validate whether the datasets are reliable, original, comprehensive, current and cited (ROCCC):

Results: Most datasets have MIN(12APR2022) with MAX(12MAY2022). Only datasets 10, 14, and 16 fall outside of this date range by +/- 1 day. Exact date ranges captured below.

*/

-- 1) daily_activity

--MIN/MAX datetime values
SELECT MIN(ActivityDate) AS MinDate, MAX(ActivityDate) AS MaxDate
FROM `linear-freehold-354220.bellabeat.daily_activity`;

-- 2) daily_calories

--MIN/MAX datetime values
SELECT MIN(ActivityDay) AS MinDate, MAX(ActivityDay) AS MaxDate
FROM `linear-freehold-354220.bellabeat.daily_calories`;

-- 3) daily_intensities

-- MIN/MAX datetime values
SELECT MIN(ActivityDay) AS MinDate, MAX(ActivityDay) AS MaxDate
FROM `linear-freehold-354220.bellabeat.daily_intensities`;

-- 4) daily_steps

-- MIN/MAX datetime values
SELECT MIN(ActivityDay) AS MinDate, MAX(ActivityDay) AS MaxDate
FROM `linear-freehold-354220.bellabeat.daily_steps`;


-- 5) heartrate_seconds

-- MIN/MAX datetime values
SELECT MIN(Time) AS MinDate, MAX(Time) AS MaxDate
FROM `linear-freehold-354220.bellabeat.heartrate_seconds`;

-- 6) daily_steps

-- MIN/MAX datetime values
SELECT MIN(ActivityHour) AS MinDate, MAX(ActivityHour) AS MaxDate
FROM `linear-freehold-354220.bellabeat.hourly_calories`;

-- 7) hourly_intensities

-- MIN/MAX datetime values
SELECT MIN(ActivityHour) AS MinDate, MAX(ActivityHour) AS MaxDate
FROM `linear-freehold-354220.bellabeat.hourly_intensities`;

-- 8) hourly_steps

-- MIN/MAX datetime values
SELECT MIN(ActivityMinute) AS MinDate, MAX(ActivityMinute) AS MaxDate
FROM `linear-freehold-354220.bellabeat.minute_calories_narrow`;

-- 9) minute_calories_narrow

-- MIN/MAX datetime values
SELECT MIN(ActivityMinute) AS MinDate, MAX(ActivityMinute) AS MaxDate
FROM `linear-freehold-354220.bellabeat.minute_calories_narrow`;

-- 10) minute_calories_wide - MIN(13APR2016) with MAX(134MAY2016)

-- MIN/MAX datetime values
SELECT MIN(ActivityHour) AS MinDate, MAX(ActivityHour) AS MaxDate
FROM `linear-freehold-354220.bellabeat.minute_calories_wide`;

-- 11) minute_calories_wide

-- MIN/MAX datetime values

SELECT MIN(ActivityMinute) AS MinDate, MAX(ActivityMinute) AS MaxDate
FROM `linear-freehold-354220.bellabeat.minute_intensities_narrow`;

-- 12) minute_intensities_wide

-- MIN/MAX datetime values

SELECT MIN(ActivityHour) AS MinDate, MAX(ActivityHour) AS MaxDate
FROM `linear-freehold-354220.bellabeat.minute_intensities_wide`;

-- 13) minute_mets_narrow

-- MIN/MAX datetime values
SELECT MIN(ActivityMinute) AS MinDate, MAX(ActivityMinute) AS MaxDate
FROM `linear-freehold-354220.bellabeat.minute_mets_narrow`;

-- 14) minute_sleep

-- MIN/MAX datetime values - MIN(11APR2016) with MAX(12MAY2016)
SELECT MIN(date) AS MinDate, MAX(date) AS MaxDate
FROM `linear-freehold-354220.bellabeat.minute_sleep`;

-- 15) minute_steps_narrow

-- MIN/MAX datetime values
SELECT MIN(ActivityMinute) AS MinDate, MAX(ActivityMinute) AS MaxDate
FROM `linear-freehold-354220.bellabeat.minute_steps_narrow`;

-- 16) minute_steps_wide

-- MIN/MAX datetime values - MIN(13APR2016) with MAX(13MAY2022)
SELECT MIN(ActivityHour) AS MinDate, MAX(ActivityHour) AS MaxDate
FROM `linear-freehold-354220.bellabeat.minute_steps_wide`;

-- 17) sleep_day

-- MIN/MAX datetime values
SELECT MIN(SleepDay) as MinDate, MAX(SleepDay) AS MaxDate
FROM `linear-freehold-354220.bellabeat.sleep_day`;

-- 18) weight_log_info

-- MIN/MAX datetime values
SELECT MIN(date) as MinDate, MAX(date) AS MaxDate
FROM `linear-freehold-354220.bellabeat.weight_log_info`;