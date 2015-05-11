##### Background #####

# This simulated data set is based on the journal article "Is More Better? The
# Relationship between Nurse Staffing and the Quality of Nursing Care in
# Hospitals" in Medical Care. In this study author, Julie Sochalski 
# (PhD, RN, FAAN), analyzed data obtained from a 1999 survey of 8,670 inpatient
# nurses from Pennsylvania, U.S.A hospitals. In this survey, nurses were asked
# to rate the quality of care from their last shift and estimate the number
# of patients they cared for, the number of tasks that went undone, and the
# number of patient safety problems that occurred during the same shift. The
# author found several correlations between the nurses' responses. The
# questions asked in this survey and the values (such as means and STD) are the
# inspiration for this simulated data set.
# 
# Sochalski, J. (2004). Is more better?: the relationship between nurse 
# staffing and the quality of nursing care in hospitals. Medical care, 42(2),
# II-67.
# 
# Here, we simulate responses to the same questions as were in that 1999 survey.
# These responses are entered into a hospital administrative system over
# several years by its nurses in an effort to better understand what the
# hospital can do to imporove patient care. The hospital has no knowledge
# of what factors correlate with patient care and is hoping to use the data
# obtained to discover relationships between the various response that will
# help them improve patient care.
# 
# Feature 1 - Sex: M/F
# Feature 2 - Quality of care as rated by nurses: Poor, Fair, Good, Excellent
# Feature 3 - Number of registered nurses on-staff during last shift: 1 - 30
# Feature 4 - Number of patients this nurse cared for during last shift: 0 - 20
# Feature 6 - Number of tasks that went undone: 0 - 7
# Feature 7 - Number of patient safety problems: 0 - 4
# Feature 5 - Date: YYYY/MM/DD

##### Create Data Set #####

generateDataSet <- function() {
  
  ## Set Constraints ##
  qualOfCare <- c("Poor", "Fair", "Good", "Excellent")
  qualOfCareMean <- c(weekday=3.3, weekend=1.8)
  qualOfCareSTD <- c(weekday=1.8, weekend=0.9)
  
  numWeekdayNurses <- c(mean=11, std=1.2)
  numWeekendNurses <- c(mean=6, std=1)
  
  numPatientsCaredFor <- c(1:28)
  numPatientsCaredForMean <- c(weekday=6.3, weekend=11.3)
  numPatientsCaredForSTD <- c(weekday=3.4, weekend=1.4)
  
  numTasksUndone <- c(0:7)
  numTasksUndoneMean <- c(weekday=0.9, weekend=2.1)
  
  numSafetyProbs <- c(0:4)
  numSafetyProbsMean <- c(weekday=0.4, weekend=1.1)
  
  startDate <- as.Date("1998/03/08")
  endDate <- as.Date("2007/12/01")
  ## End Constraints ##
  
  
  ## Create Dates and Distribution of Number of Nurses per Day ##
  # Create a list of possible dates to sample from:
  # |    date    |  weekday | day |  type   |
  # | 1998/03/08 |  Sunday  |  0  | weekend |         
  # | 1998/03/09 |  Monday  |  1  | weekday |
  #                .
  #                .
  #                .
  dates <- data.frame(date=seq.Date(startDate, endDate, by='day'))
  dates$weekday <- weekdays(as.Date(dates$date))
  dates$day <- as.POSIXlt(dates$date)$wday
  type <- c(Sunday='weekend',
            Monday='weekday',
            Tuesday='weekday',
            Wednesday='weekday',
            Thursday='weekday',
            Friday='weekday',
            Saturday='weekend')
  dates$type <- type[dates$weekday]
  
  # Sample number of nurses worked per day on weekdays
  dates$numNurses <- NA
  dates$numNurses[dates$type == 'weekday'] <- round(
    rnorm(n=length(dates$numNurses[dates$type == 'weekday']),
          mean=numWeekdayNurses['mean'],
          sd=numWeekdayNurses['std']),
    digits=0
  )
  # And on weekends
  dates$numNurses[dates$type == 'weekend'] <- round(
    rnorm(n=length(dates$numNurses[dates$type == 'weekend']),
          mean=numWeekendNurses['mean'],
          sd=numWeekendNurses['std']),
    digits=0
  )
  
  # print(mean(dates$numNurses))
  # print(mean(dates$numNurses[dates$type == 'weekday']))
  # print(mean(dates$numNurses[dates$type == 'weekend']))
  ## End Dates Creation ##
  
  
  ## Create data frame of entries based on daily values ##
  # Expands each day in the dates data frame N times, where N is
  # dates$numNurses, so for each day you have an entry for every nurse working
  # that day.
  dataSet <- data.frame(dates[rep(c(1:nrow(dates)), dates$numNurses), c(1, 4)],
                        row.names=NULL
  )
  # Above, c(1, 4) tells to take columns 1 and 4 from the 'dates' data frame.
  names(dataSet) <- c('date', 'type')
  
  # Set quality rating for weekend and weekday
  dataSet$qualOfCare = NA
  # Weekdays
  weekdayRows <- dataSet$qualOfCare[dataSet$type == 'weekday']
  qualRatingWeekday <- sample(x=c(1:4),
                              size=length(weekdayRows),
                              replace=TRUE,
                              prob=c(.02, .04, .30, .64)
  )
  # mean(qualRatingWeekday)
  # sd(qualRatingWeekday)
  # hist(qualRatingWeekday)
  dataSet$qualOfCare[dataSet$type == 'weekday'] <- qualRatingWeekday
  # Weekend
  weekendRows <- dataSet$qualOfCare[dataSet$type == 'weekend']
  qualRatingWeekend <- sample(x=c(1:4),
                              size=length(weekendRows),
                              replace=TRUE,
                              prob=c(.4, .33, .21, .06))
  # mean(qualRatingWeekend)
  # sd(qualRatingWeekend)
  # hist(qualRatingWeekend)
  dataSet$qualOfCare[dataSet$type == 'weekend'] <- qualRatingWeekend
  
  
  ## Set linear relationship between quality of care and other stuff
  dataSet$numPatientsCaredFor <- NA
  dataSet$numPatientsCaredFor[dataSet$type == 'weekday'] <- vapply(dataSet$qualOfCare[dataSet$type == 'weekday'], FUN.VALUE=double(1), FUN=function(qual){
    round((-1.76*qual + sample(c(-2:2, by=.1), size=1) + 10), digits=0)
  })
  dataSet$numPatientsCaredFor[dataSet$type == 'weekend'] <- vapply(dataSet$qualOfCare[dataSet$type == 'weekend'], FUN.VALUE=double(1), FUN=function(qual){
    round((-1.76*qual + sample(c(-2:2, by=.1), size=1) + 10), digits=0)
  })
  # dataSet$numPatientsCaredFor <- 1.76*(dataSet$qualOfCare) + sample(c(-4:4, by=.1), size=1) + 10
  mean(dataSet$numPatientsCaredFor[dataSet$type == 'weekday'])
  mean(dataSet$numPatientsCaredFor[dataSet$type == 'weekend'])
  min(dataSet$numPatientsCaredFor)
  max(dataSet$numPatientsCaredFor)
  
  ## Add number of staffed nurses that day for verification
  dataSet$numStaffedNursesDailyTotal <- NA
  dataSet$numStaffedNursesDailyTotal <- vapply(dataSet$date, FUN.VALUE=double(1), FUN=function(d){
    length(dataSet$date[dataSet$date == d])
  })
  mean(dataSet$numStaffedNursesDailyTotal[dataSet$type == 'weekday'])
  mean(dataSet$numStaffedNursesDailyTotal[dataSet$type == 'weekend'])
  min(dataSet$numStaffedNursesDailyTotal)
  max(dataSet$numStaffedNursesDailyTotal)
  
}


