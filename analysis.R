#Import libraries
library(tidyverse)
library(skimr)
library(janitor)
library(knitr)
library(plyr)
library(lubridate)
library(flipTime)

#Load cleaned CSVs
daily_activity <- read_csv("/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/Cleaned/dailyActivity_cleaned.csv")
daily_calories <- read_csv("/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/Cleaned/dailyCalories_cleaned.csv")
daily_intensities <- read_csv("/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/Cleaned/dailyIntensities_cleaned.csv")
daily_steps <- read_csv("/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/Cleaned/dailySteps_cleaned.csv")
heartrate_seconds <- read_csv("/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/Cleaned/heartrateSeconds_cleaned.csv")
hourly_calories <- read_csv("/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/Cleaned/hourlyCalories_cleaned.csv")
hourly_intensities <- read_csv("/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/Cleaned/hourlyIntensities_cleaned.csv")
hourly_steps <- read_csv("/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/Cleaned/hourlySteps_cleaned.csv")
minute_calories_narrow <- read_csv("/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/Cleaned/minuteCaloriesNarrow_cleaned.csv")
minute_calories_wide <- read_csv("/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/Cleaned/minuteCaloriesWide_cleaned.csv")
minute_intensities_narrow <- read_csv("/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/Cleaned/minuteIntensitiesNarrow_cleaned.csv")
minute_intensities_wide <- read_csv("/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/Cleaned/minuteIntensitiesWide_cleaned.csv")
minute_mets_narrow <- read_csv("/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/Cleaned/minuteMETsNarrow_cleaned.csv")
minute_sleep <- read_csv("/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/Cleaned/minuteSleep_cleaned.csv")
minute_steps_narrow <- read_csv("/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/Cleaned/minuteStepsNarrow_cleaned.csv")
minute_steps_wide <- read_csv("/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/Cleaned/minuteStepsWide_cleaned.csv")
sleep_day <- read_csv("/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/Cleaned/sleepDay_cleaned.csv")
weight_log_info <- read_csv("/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/Cleaned/weightLogInfo_cleaned.csv")

# Exploratory Analysis

# Explore daily_activity

#Check head
head(daily_activity)

# Check column names
colnames(daily_activity)

# Check distinct IDs - 33
n_distinct(daily_activity$Id)

# Check number of rows - 940
nrow(daily_activity)

# Select summary stats - daily_activity stats
daily_activity %>% 
  select(TotalSteps,
         Calories,
         TotalDistance,
         SedentaryMinutes) %>%
  summary()

# Add column for day of week - Reference - https://www.statology.org/r-day-of-week/
daily_activity$ActivityDay <- wday(daily_activity$ActivityDate, label=TRUE, abbr=FALSE)
sleep_day$WeekDay <- wday(sleep_day$SleepDay, label=TRUE, abbr=FALSE)
hourly_steps$Day <- wday(hourly_steps$ActivityHour, label=TRUE, abbr=FALSE)
hourly_intensities$Day <- wday(hourly_intensities$ActivityHour, label=TRUE, abbr=FALSE)
hourly_calories$Day <- wday(hourly_calories$ActivityHour, label=TRUE, abbr=FALSE)
hourly_steps$Day <- wday(hourly_steps$ActivityHour, label=TRUE, abbr=FALSE)
heartrate_seconds$Day <- wday(heartrate_seconds$Time, label=TRUE, abbr=FALSE)

# Add column for sum of all minutes


# Add column for hour
hourly_steps$Hour <- hour(hourly_steps$ActivityHour)
hourly_intensities$Hour <- hour(hourly_intensities$ActivityHour)
hourly_calories$Hour <- hour(hourly_calories$ActivityHour)
hourly_steps$Hour <- hour(hourly_steps$ActivityHour)
heartrate_seconds$Hour <- hour(heartrate_seconds$Time)

# Add column for 


# Write updated csv for Tableau
write_csv(daily_activity, file="/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/Tableau/daily_activity_tableau.csv")
write_csv(hourly_steps, file="/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/Tableau/hourly_steps_tableau.csv")
write_csv(hourly_intensities, file="/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/Tableau/hourly_intensities_tableau.csv")
write_csv(hourly_calories, file="/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/Tableau/hourly_calories_tableau.csv")
write_csv(hourly_steps, file="/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/Tableau/hourly_steps_tableau.csv")
write_csv(sleep_day, file="/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/Tableau/sleep_day_tableau.csv")
write_csv(heartrate_seconds, file="/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/Tableau/heartrate_seconds_tableau.csv")

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


# Calculate % of Active Minutes
TotalSedentaryMins <- sum(daily_activity$SedentaryMinutes)

TotalLightlyActiveMins <- sum(daily_activity$LightlyActiveMinutes)

TotalFairlyActiveMins <- sum(daily_activity$FairlyActiveMinutes)

TotalVeryActiveMins <- sum(daily_activity$VeryActiveMinutes)

TotalActiveMins <- sum(TotalFairlyActiveMins + TotalLightlyActiveMins + TotalSedentaryMins + TotalVeryActiveMins)

SedentaryMinPercent<- round(TotalSedentaryMins/TotalActiveMins * 100, 2)
LightlyMinPercent<- round(TotalLightlyActiveMins/TotalActiveMins * 100, 2)
FairlyMinPercent<- round(TotalFairlyActiveMins/TotalActiveMins * 100, 2)
VeryMinPercent<- round(TotalVeryActiveMins/TotalActiveMins * 100, 2)

# Validate that percentages sum to 100%
PercentTotal<- sum(SedentaryMinPercent+LightlyMinPercent+FairlyMinPercent+VeryMinPercent)

activityMinsPercent_df <- data.frame(ActivityType = c(
  "Sedentary", 
  "LightlyActive", 
  "FairlyActive", 
  "VeryActive"),
  Percent = c(SedentaryMinPercent, LightlyMinPercent, FairlyMinPercent, VeryMinPercent)
)

# Write to csv for Tableau pie chart
write_csv(activityMinsPercent_df, file="/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/Tableau/ActivityMinsPercent_tableau.csv")


# Create Bar plot to prep for pie chart - Reference - http://www.sthda.com/english/wiki/ggplot2-pie-chart-quick-start-guide-r-software-and-data-visualization
activity_bp <- ggplot(activityMinsPercent_df, aes(x="", y=Percent, fill=ActivityType)) +
  geom_bar(width=1, stat="identity")

activity_pie <- activity_bp + coord_polar("y", start=0) + geom_text(label = Percent, check_overlap = TRUE)
activity_pie

# Exploring visualizations

#Visualize daily_activity

# Assign color_range and colors variables for plotting
color_range <- colorRampPalette(c("#0071bc","#cd2026"))
colors <- color_range(1000)


# Plot Totals Steps to number of Calories burned - Reference - https://statisticsglobe.com/change-continuous-color-range-ggplot2-plot-r
ggplot(data=daily_activity, aes(x=TotalSteps, y=Calories, color=Calories)) + 
  geom_point() +
  scale_colour_gradientn(colors=colors) +
  geom_smooth(method=lm)

daily_activity %>% 
  group_by(Id) %>% 
  summarize(SumTotalSteps = sum(TotalSteps),SumCalories = sum(Calories)) %>% 
  ggplot(data=daily_activity(aes(x=SumTotalSteps, y=SumCalories, color=SumCalories, group=Id)) + 
           geom_point() +
           scale_colour_gradientn(colors=colors)
         
         
# Assign x_axis_labels - Reference - https://methodmatters.github.io/exploratory-data-analysis-cell-phone-part-1/
x_axis_labels <- seq(from = 0, to = 23, by = 1)

daily_activity %>%
 ggplot(aes(x = ActivityHour, y=Calories)) + geom_bar(stat="identity") +
 labs("Hour of Day", y="Total", title="Calories Burned Across the Day") +
 scale_x_continuous(labels=daily_activity$ActivityHour, breaks=daily_activity$ActivityHour)

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

# Explore hourly_calories
head(hourly_calories)

#Check nulls
sum(is.na(hourly_calories))

# Check duplicates
sum(duplicated(hourly_calories))

# Check rows
nrow(hourly_calories)

glimpse(hourly_calories)

ggplot(hourly_calories, aes(x=ActivityHour, y=Calories)) + geom_point()