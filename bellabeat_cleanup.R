#Install packages
install.packages("tidyverse")
install.packages("skimr")
install.packages("janitor")
install.packages("devtools")
require(devtools)
install_github("Displayr/flipTime")

#Import libraries
library(tidyverse)
library(skimr)
library(janitor)
library(lubridate)
library(flipTime)

# Load CSVs
daily_activity <- read_csv("/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/dailyActivity_merged.csv")
heartrate_seconds <-read_csv("/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/heartrate_seconds_merged.csv")
hourly_calories <-read_csv("/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/hourlyCalories_merged.csv")
hourly_intensities <-read_csv("/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/hourlyIntensities_merged.csv")
hourly_steps <-read_csv("/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/hourlySteps_merged.csv")
minute_calories_narrow <-read_csv("/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/minuteCaloriesNarrow_merged.csv")
minute_calories_wide <-read_csv("/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/minuteCaloriesWide_merged.csv")
minute_intensities_narrow <-read_csv("/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/minuteIntensitiesNarrow_merged.csv")
minute_intensities_wide <-read_csv("/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/minuteIntensitiesWide_merged.csv")
minute_mets_narrow <- read_csv("/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/minuteMETsNarrow_merged.csv")
minute_sleep <- read_csv("/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/minuteSleep_merged.csv")
minute_steps_narrow <- read_csv("/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/minuteStepsNarrow_merged.csv")
minute_steps_wide <- read_csv("/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/minuteStepsWide_merged.csv")
sleep_day <- read_csv("/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/sleepDay_merged.csv")
weight_log_info <- read_csv("/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/weightLogInfo_merged.csv")

# Check head
head(heartrate_seconds)
head(hourly_calories)
head(hourly_intensities)
head(hourly_steps)
head(minute_calories_narrow)
head(minute_calories_wide)
head(minute_intensities_narrow)
head(minute_intensities_wide)
head(minute_mets_narrow)
head(minute_sleep)
head(minute_steps_narrow)
head(minute_steps_wide)
head(sleep_day)
head(weight_log_info)

# Glimpse
glimpse(heartrate_seconds)
glimpse(hourly_calories)
glimpse(hourly_intensities)
glimpse(hourly_steps)
glimpse(minute_calories_narrow)
glimpse(minute_calories_wide)
glimpse(minute_intensities_narrow)
glimpse(minute_intensities_wide)
glimpse(minute_mets_narrow)
glimpse(minute_sleep)
glimpse(minute_steps_narrow)
glimpse(minute_steps_wide)
glimpse(sleep_day)
glimpse(weight_log_info)

# Skim without charts
skim_without_charts(heartrate_seconds)
skim_without_charts(hourly_calories)
skim_without_charts(hourly_intensities)
skim_without_charts(hourly_steps)
skim_without_charts(minute_calories_narrow)
skim_without_charts(minute_calories_wide)
skim_without_charts(minute_intensities_narrow)
skim_without_charts(minute_intensities_wide)
skim_without_charts(minute_mets_narrow)
skim_without_charts(minute_sleep)
skim_without_charts(minute_steps_narrow)
skim_without_charts(minute_steps_wide)
skim_without_charts(sleep_day)
skim_without_charts(weight_log_info)

# Check column names
colnames(heartrate_seconds)
colnames(hourly_calories)
colnames(hourly_intensities)
colnames(hourly_steps)
colnames(minute_calories_narrow)
colnames(minute_calories_wide)
colnames(minute_intensities_narrow)
colnames(minute_intensities_wide)
colnames(minute_mets_narrow)
colnames(minute_sleep)
colnames(minute_steps_narrow)
colnames(minute_steps_wide)
colnames(sleep_day)
colnames(weight_log_info)

# Check nulls
sum(is.na(daily_activity_df))
sum(is.na(hourly_calories))
sum(is.na(hourly_intensities))
sum(is.na(hourly_steps))
sum(is.na(minute_calories_narrow))
sum(is.na(minute_calories_wide))
sum(is.na(minute_intensities_narrow))
sum(is.na(minute_intensities_wide))
sum(is.na(minute_mets_narrow))
sum(is.na(minute_sleep))
sum(is.na(minute_steps_narrow))
sum(is.na(minute_steps_wide))
sum(is.na(sleep_day))
sum(is.na(weight_log_info))

# View DataFrame
View(heartrate_seconds)
View(hourly_calories)
View(hourly_intensities)
View(hourly_steps)
View(minute_calories_narrow)
View(minute_calories_wide)
View(minute_intensities_narrow)
View(minute_intensities_wide)
View(minute_mets_narrow)
View(minute_sleep)
View(minute_steps_narrow)
View(minute_steps_wide)
View(sleep_day)
View(weight_log_info)

# Convert time column to datetime - Reference - https://www.displayr.com/r-date-conversion/
heartrate_seconds$Time <- AsDateTime(heartrate_seconds$Time)
hourly_calories$ActivityHour <- AsDateTime(hourly_calories$ActivityHour)
hourly_intensities$ActivityHour <- AsDateTime(hourly_intensities$ActivityHour)
hourly_steps$ActivityHour <- AsDateTime(hourly_steps$ActivityHour)
minute_calories_narrow$ActivityMinute <- AsDateTime(minute_calories_narrow$ActivityMinute)
minute_calories_wide$ActivityHour <- AsDateTime(minute_calories_wide$ActivityHour)
minute_intensities_narrow$ActivityMinute <- AsDateTime(minute_intensities_narrow$ActivityMinute)
minute_intensities_wide$ActivityHour <- AsDateTime(minute_intensities_wide$ActivityHour)
minute_mets_narrow$ActivityMinute <- AsDateTime(minute_mets_narrow$ActivityMinute)
minute_sleep$date <- AsDateTime(minute_sleep$date)
minute_steps_narrow$ActivityMinute <- AsDateTime(minute_steps_narrow$ActivityMinute)
minute_steps_wide$ActivityHour <- AsDateTime(minute_steps_wide$ActivityHour)
sleep_day$SleepDay <- AsDateTime(sleep_day$SleepDay)
weight_log_info$Date <- AsDateTime(weight_log_info$Date)

# Write to csv to load in Big Query database
write_csv(heartrate_seconds, file="/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/Datetime-Adjusted/heartrate_seconds_dt.csv")
write_csv(hourly_calories, file="/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/Datetime-Adjusted/hourlyCalories_dt.csv")
write_csv(hourly_intensities, file="/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/Datetime-Adjusted/hourlyIntensities_dt.csv")
write_csv(hourly_steps, file="/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/Datetime-Adjusted/hourlySteps_dt.csv")
write_csv(minute_calories_narrow, file="/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/Datetime-Adjusted/minuteCaloriesNarrow_dt.csv")
write_csv(minute_calories_wide, file="/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/Datetime-Adjusted/minuteCaloriesWide_dt.csv")
write_csv(minute_intensities_narrow, file="/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/Datetime-Adjusted/minuteIntensitiesNarrow_dt.csv")
write_csv(minute_intensities_wide, file="/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/Datetime-Adjusted/minuteIntensitiesWide_dt.csv")
write_csv(minute_mets_narrow, file="/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/Datetime-Adjusted/minuteMETsNarrow_dt.csv")
write_csv(minute_sleep, file="/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/Datetime-Adjusted/minuteSleep_dt.csv")
write_csv(minute_steps_narrow, file="/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/Datetime-Adjusted/minuteStepsNarrow_dt.csv")
write_csv(minute_steps_wide, file="/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/Datetime-Adjusted/minuteStepsWide_dt.csv")
write_csv(sleep_day, file="/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/Datetime-Adjusted/sleepDay_dt.csv")
write_csv(weight_log_info, file="/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/Datetime-Adjusted/weightLogInfo_dt.csv")


# Exploratory Analysis

# Explore daily_activity

#Check head
head(daily_activity)

# Check column names
colnames(daily_activity)

# Check distinct IDs - 33
n_distinct(daily_activity$Id)

# Check duplicates
sum(duplicated(daily_activity))

# Check number of rows - 940
nrow(daily_activity)

# Select summary stats - daily_activity stats
daily_activity %>% 
  select(TotalSteps,
         TotalDistance,
         SedentaryMinutes) %>%
  summary()

# Explore sleep_day

# Check head
head(sleep_day)

# Check column names
colnames(sleep_day)

# sleep_day stats
sleep_day %>% 
  select(TotalSleepRecords,
         TotalMinutesAsleep,
         TotalTimeInBed) %>% 
  summary()

# Explore minute_mets_narrow

# Check head
head(minute_mets_narrow)

# Check colnames
colnames(minute_mets_narrow)

# Check rows
nrow(minute_mets_narrow)

# Check stats
minute_mets_narrow %>% 
  select(ActivityMinute,
         METs) %>% 
  summary()

# Exploring visualizations

#Visualize daily_activity
ggplot(data=daily_activity, aes(x=TotalSteps, y=SedentaryMinutes)) + geom_point()

ggplot(data=daily_activity, aes(x=TotalSteps, y=Calories)) + geom_point()

# Visualize sleep_day
ggplot(data=sleep_day, aes(x=TotalMinutesAsleep, y=TotalTimeInBed)) + geom_point()

ggplot(data=minute_mets_narrow, aes(x=METs)) + geom_bar()


# Merge datasets - daily_activity, sleep_day
combined_df <- merge(daily_activity, sleep_day, by="Id")

# Check rows - 12348
nrow(combined_df)

# Merge datasets - combined_df, minute_mets_narrow
#combined_df <- merge(combined_df, minute_mets_narrow, by="Id")

# Check distinct IDs - 24
n_distinct(combined_df$Id)

# Check rows - 12441
nrow(combined_df)

subset(x=combined_df, Id=="1503960366", select= c("TotalSteps", "Calories"))

#ggplot(subset(combined_df, Id=="1503960366", ["TotalSteps", "Calories"]), aes(x=TotalSteps)) + geom_line() 
       
ggplot(data=sleep_day, aes(x=TotalMinutesAsleep, y=TotalTimeInBed)) + geom_point()

glimpse(combined_df)

# Explore weight_log_info

#Check head
head(weight_log_info)

#Check nulls - 65
sum(is.na(weight_log_info))

# Check nulls for column Fat - 65
sum(is.na(weight_log_info$Fat))

# Check row - 67
nrow(weight_log_info)

# Check distinct IDs - 8
n_distinct(weight_log_info$Id)

# Check duplicates
sum(duplicated(weight_log_info))

# Check IsManualReport boolean count
# is TRUE = 41
sum(weight_log_info$IsManualReport==TRUE)
# is FALSE = 26
sum(weight_log_info$IsManualReport==FALSE)

# Drop Fat column
na.omit(weight_log_info)

#View dataset
View(weight_log_info)

# Check summary stats
weight_log_info %>% 
  select(Fat,
         BMI,
         WeightKg,
         WeightPounds) %>% 
  summary()