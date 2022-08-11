#Install packages
install.packages("tidyverse")

#Import libraries
library(tidyverse)

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

# Explore daily_activity data

#Check head
head(daily_activity)

# Check column names
colnames(daily_activity)

# Check distinct IDs - 33
n_distinct(daily_activity$Id)

# Check number of rows - 940
nrow(daily_activity)

# Summary stats - daily_activity
daily_activity %>% 
  select(TotalSteps,
         Calories,
         TotalDistance,
         SedentaryMinutes,
         LightlyActiveMinutes,
         FairlyActiveMinutes,
         VeryActiveMinutes) %>%
  summary()

# Prep DataFrames for Tableau

# Add column for day of week - Reference - https://www.statology.org/r-day-of-week/
daily_activity$ActivityDay <- wday(daily_activity$ActivityDate, label=TRUE, abbr=FALSE)
sleep_day$WeekDay <- wday(sleep_day$SleepDay, label=TRUE, abbr=FALSE)
hourly_steps$Day <- wday(hourly_steps$ActivityHour, label=TRUE, abbr=FALSE)
hourly_intensities$Day <- wday(hourly_intensities$ActivityHour, label=TRUE, abbr=FALSE)
hourly_calories$Day <- wday(hourly_calories$ActivityHour, label=TRUE, abbr=FALSE)
hourly_steps$Day <- wday(hourly_steps$ActivityHour, label=TRUE, abbr=FALSE)
heartrate_seconds$Day <- wday(heartrate_seconds$Time, label=TRUE, abbr=FALSE)

# Add column for hour
hourly_steps$Hour <- hour(hourly_steps$ActivityHour)
hourly_intensities$Hour <- hour(hourly_intensities$ActivityHour)
hourly_calories$Hour <- hour(hourly_calories$ActivityHour)
hourly_steps$Hour <- hour(hourly_steps$ActivityHour)
heartrate_seconds$Hour <- hour(heartrate_seconds$Time)

# Calculate % of Active Minutes for Tableau Pie Chart

# Sum Activity Mins
TotalSedentaryMins <- sum(daily_activity$SedentaryMinutes)

TotalLightlyActiveMins <- sum(daily_activity$LightlyActiveMinutes)

TotalFairlyActiveMins <- sum(daily_activity$FairlyActiveMinutes)

TotalVeryActiveMins <- sum(daily_activity$VeryActiveMinutes)

TotalActiveMins <- sum(TotalFairlyActiveMins + TotalLightlyActiveMins + TotalSedentaryMins + TotalVeryActiveMins)

# Calculate % values
SedentaryMinPercent<- round(TotalSedentaryMins/TotalActiveMins * 100, 2)
LightlyMinPercent<- round(TotalLightlyActiveMins/TotalActiveMins * 100, 2)
FairlyMinPercent<- round(TotalFairlyActiveMins/TotalActiveMins * 100, 2)
VeryMinPercent<- round(TotalVeryActiveMins/TotalActiveMins * 100, 2)

# Validate that percentages sum to 100%
PercentTotal<- sum(SedentaryMinPercent+LightlyMinPercent+FairlyMinPercent+VeryMinPercent)

# Create DataFrame for Tableau
activityMinsPercent_df <- data.frame(ActivityType = c(
  "Sedentary", 
  "LightlyActive", 
  "FairlyActive", 
  "VeryActive"),
  Percent = c(SedentaryMinPercent, LightlyMinPercent, FairlyMinPercent, VeryMinPercent)
)

# Write updated csv for Tableau visualizations
write_csv(daily_activity, file="/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/Tableau/daily_activity_tableau.csv")
write_csv(hourly_steps, file="/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/Tableau/hourly_steps_tableau.csv")
write_csv(hourly_intensities, file="/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/Tableau/hourly_intensities_tableau.csv")
write_csv(hourly_calories, file="/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/Tableau/hourly_calories_tableau.csv")
write_csv(hourly_steps, file="/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/Tableau/hourly_steps_tableau.csv")
write_csv(sleep_day, file="/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/Tableau/sleep_day_tableau.csv")
write_csv(heartrate_seconds, file="/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/Tableau/heartrate_seconds_tableau.csv")
write_csv(activityMinsPercent_df, file="/Users/tyesondemets/Desktop/Git/Health-App-Usage-Analytics/Resources/Tableau/ActivityMinsPercent_tableau.csv")

# Explore R visualizations

# Create Bar plot to prep for pie chart - Reference - http://www.sthda.com/english/wiki/ggplot2-pie-chart-quick-start-guide-r-software-and-data-visualization
activity_bp <- ggplot(activityMinsPercent_df, aes(x="", y=Percent, fill=ActivityType)) +
  geom_bar(width=1, stat="identity")

activity_pie <- activity_bp + coord_polar("y", start=0) + geom_text(label = Percent, check_overlap = TRUE)
activity_pie

#Visualize daily_activity

# Assign color_range and colors variables for plotting
color_range <- colorRampPalette(c("#0071bc","#cd2026"))
colors <- color_range(1000)


# Plot Totals Steps to number of Calories burned - Reference - https://statisticsglobe.com/change-continuous-color-range-ggplot2-plot-r
ggplot(data=daily_activity, aes(x=TotalSteps, y=Calories, color=Calories)) + 
  geom_point() +
  scale_colour_gradientn(colors=colors) +
  geom_smooth(method=lm)

# Visualize sleep_day
ggplot(data=sleep_day, aes(x=TotalMinutesAsleep, y=TotalTimeInBed)) + geom_point()

#Visualize minute_mets_narrow
ggplot(data=minute_mets_narrow, aes(x=METs)) + geom_bar()