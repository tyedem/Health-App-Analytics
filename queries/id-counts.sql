/* BigQuery

Description: These DISTINCT ID counts for each dataset during the Prepare phase of the project to validate whether the datasets are reliable, original, comprehensive, current and cited (ROCCC)

Results: 14/18 datasets have 33 distinct IDs. Dataset 5 has 14 distinct IDs. Datasets 14 and 17 have 24 distinct IDs and dataset 18 has 8 disinct IDs. The low number of distinct IDs in dataset
(heartrate_seconds) and dataset 18 (weight_log_info) reflects the lack of uptake on these app features. We may surmise that there is room for opportunity to optimize these features for greater adoption and use.

For datasets with < 33 distinct IDs, queries were run to obtain list of these IDs and to confirm whether there are IDs that are not found in the full list of 33 users. No discrepancies identified. These
queries are captured below.

Some additional COUNT queries are run through the daily datasets and these related observations are captured below.

*/

SELECT 
    Id, 
    COUNT(Id) AS IdCount 
FROM 
    `linear-freehold-354220.bellabeat.daily_activity`
GROUP BY
     Id
ORDER BY
     IdCount DESC;

-- 1) daily_activity

-- ID Count - 33

SELECT 
    COUNT(DISTINCT(Id)) AS IDCount
FROM 
    `linear-freehold-354220.bellabeat.daily_activity`;

-- Daily entries per distinct ID

SELECT 
    Id, 
    COUNT(Id) AS IdCount 
FROM 
    `linear-freehold-354220.bellabeat.daily_activity`
GROUP BY
     Id
ORDER BY
     IdCount DESC;

-- Daily entries <= 10 per distinct ID

SELECT 
    Id, 
    COUNT(Id) AS IdCount 
FROM 
    `linear-freehold-354220.bellabeat.daily_activity`
GROUP BY
     Id
HAVING
  IdCount <= 16
ORDER BY
     IdCount DESC;

-- Total # of days - 31

SELECT 
    COUNT(DISTINCT(ActivityDate)) AS day_count
FROM 
    `linear-freehold-354220.bellabeat.daily_activity`;

--Observations: Not every user uses the app every single day of the sample date range. Only 12% of users use the app less than half of the time.

-- 2) daily_calories 

-- ID Count - 33 
SELECT 
    COUNT(DISTINCT(Id)) AS IDCount
FROM 
`linear-freehold-354220.bellabeat.daily_calories`;

-- 3) daily_intensities

-- ID Count - 33

SELECT 
    COUNT(DISTINCT(Id)) AS IDCount
FROM 
    `linear-freehold-354220.bellabeat.daily_intensities`;

-- 4) daily_steps

-- ID Count - 33

SELECT 
    COUNT(DISTINCT(Id)) AS IDCount
FROM 
    `linear-freehold-354220.bellabeat.daily_steps`;

-- 5) heartrate_seconds

-- ID Count - 14

SELECT 
    COUNT(DISTINCT(Id)) AS IDCount
FROM
    `linear-freehold-354220.bellabeat.heartrate_seconds`;

-- JOIN distinct IDs with daily_activity.Id with heartrate_seconds.Id

--CREATE VIEW `linear-freehold-354220.bellabeat.id_view1` AS
SELECT 
    DISTINCT(daily_activity.Id)
FROM 
    `linear-freehold-354220.bellabeat.daily_activity` AS daily_activity
INNER JOIN
    `linear-freehold-354220.bellabeat.heartrate_seconds` AS heartrate_seconds 
  ON 
    daily_activity.Id = heartrate_seconds.Id
ORDER BY 
    daily_activity.Id;

--Output: 14 entries

Id
2022484408
2026352035
2347167796
4020332650
4388161847
4558609924
5553957443
5577150313
6117666160
6775888955
6962181067
7007744171
8792009665
8877689391

-- 6) daily_steps

-- ID Count - 33

SELECT 
    COUNT(DISTINCT(Id)) AS IDCount
FROM
    `linear-freehold-354220.bellabeat.hourly_calories`;

-- 7) hourly_intensities

-- ID Count - 33

SELECT 
    COUNT(DISTINCT(Id)) AS IDCount
FROM
    `linear-freehold-354220.bellabeat.hourly_intensities`;

-- 8) hourly_steps

-- ID Count - 33

SELECT 
    COUNT(DISTINCT(Id)) AS IDCount
FROM 
    `linear-freehold-354220.bellabeat.hourly_steps`;

-- 9) minute_calories_narrow

-- ID Count - 33

SELECT 
    COUNT(DISTINCT(Id)) AS IDCount
FROM 
    `linear-freehold-354220.bellabeat.minute_calories_narrow`;

-- 10) minute_calories_wide

-- ID Count - 33

SELECT 
    COUNT(DISTINCT(Id)) AS IDCount
FROM 
    `linear-freehold-354220.bellabeat.minute_calories_wide`;

-- 11) minute_intensities_narrow

-- ID Count - 33

SELECT 
    COUNT(DISTINCT(Id)) AS IDCount
FROM 
    `linear-freehold-354220.bellabeat.minute_intensities_narrow`;

-- 12) minute_intensities_wide

-- ID Count - 33 

SELECT 
    COUNT(DISTINCT(Id)) AS IDCount
FROM 
    `linear-freehold-354220.bellabeat.minute_intensities_wide`;

-- 13) minute_mets_narrow

-- ID Count - 33

SELECT 
    COUNT(DISTINCT(Id)) AS IDCount
FROM 
    `linear-freehold-354220.bellabeat.minute_mets_narrow`;

-- 14) minute_sleep

-- ID Count - 24

SELECT 
    COUNT(DISTINCT(Id)) AS IDCount
FROM 
    `linear-freehold-354220.bellabeat.minute_sleep`;

-- JOIN distinct IDs with daily_activity.Id with minute_sleep.Id

SELECT 
    DISTINCT(daily_activity.Id)
FROM 
    `linear-freehold-354220.bellabeat.daily_activity` AS daily_activity
INNER JOIN 
    `linear-freehold-354220.bellabeat.minute_sleep` AS minute_sleep 
  ON 
    daily_activity.Id = minute_sleep.Id
ORDER BY
     daily_activity.Id;

--Output: 24 entries

Id
1503960366
1644430081
1844505072
1927972279
2026352035
2320127002
2347167796
3977333714
4020332650
4319703577
4388161847
4445114986
4558609924
4702921684
5553957443
5577150313
6117666160
6775888955
6962181067
7007744171
7086361926
8053475328
8378563200
8792009665

-- 15) minute_steps_narrow

-- ID Count - 33

SELECT 
    COUNT(DISTINCT(Id)) AS IDCount
FROM 
    `linear-freehold-354220.bellabeat.minute_steps_narrow`;

-- 16) minute_steps_wide

-- ID Count - 33

SELECT 
    COUNT(DISTINCT(Id)) AS IDCount
FROM 
    `linear-freehold-354220.bellabeat.minute_steps_wide`;

-- 17) sleep_day

-- ID Count - 24

SELECT 
    COUNT(DISTINCT(Id)) AS IDCount
FROM 
    `linear-freehold-354220.bellabeat.sleep_day`;

-- JOIN distinct IDs with daily_activity.Id with sleep_day.Id

SELECT 
    DISTINCT(daily_activity.Id)
FROM 
    `linear-freehold-354220.bellabeat.daily_activity` AS daily_activity
INNER JOIN 
    `linear-freehold-354220.bellabeat.sleep_day` as sleep_day 
  ON 
    daily_activity.Id = sleep_day.Id
ORDER BY 
    daily_activity.Id;


--Output: 24 entries

Id
1503960366
1644430081
1844505072
1927972279
2026352035
2320127002
2347167796
3977333714
4020332650
4319703577
4388161847
4445114986
4558609924
4702921684
5553957443
5577150313
6117666160
6775888955
6962181067
7007744171
7086361926
8053475328
8378563200
8792009665

-- 18) weight_log_info

-- ID Count - 8

SELECT COUNT
    (DISTINCT(Id)) AS IDCount
FROM 
    `linear-freehold-354220.bellabeat.weight_log_info`;


--JOIN distinct IDs with daily_activity.Id with weight_log_info.Id

SELECT 
    DISTINCT(daily_activity.Id)
FROM 
    `linear-freehold-354220.bellabeat.daily_activity` AS daily_activity
INNER JOIN 
    `linear-freehold-354220.bellabeat.weight_log_info` as weight_log_info
  ON 
    daily_activity.Id = weight_log_info.Id
ORDER BY
     daily_activity.Id;

--Output: 8 entries
Id
1503960366
1927972279
2873212765
4319703577
4558609924
5577150313
6962181067
8877689391
