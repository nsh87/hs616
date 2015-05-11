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
# help them achieve their goal.
# 
# Feature 1 - Sex: M/F
# Feature 2 - Quality of care as rated by nurses: Poor, Fair, Good, Excellent
# Feature 3 - Number of registered nurses on-staff during last shift: 1 - 30
# Feature 4 - Number of patients this nurse cared for during last shift: 0 - 20
# Feature 6 - Number of tasks that went undone: 0 - 7
# Feature 7 - Number of patient safety problems: 0 - 4
# Feature 5 - Date: YYYY/MM/DD

##### Create Data Set #####

generateDataSet <- function(startDate, endDate) {
  
  # Set constraints
  qualOfCareOptions <- c("Poor", "Fair", "Good", "Excellent")
  qualOfCareProb <- list(weekday=c(.02, .04, .30, .64),
                      weekend=c(.4, .33, .21, .06))
  numNurses <- c(weekday=c(mean=11, sd=1.2),
                 weekend=c(mean=6, sd=1))
  
  numTasksUndone <- c(0:7)
  numTasksUndoneMean <- c(weekday=1.9, weekend=4.1)
  numSafetyProbs <- c(0:4)
  numSafetyProbsMean <- c(weekday=0.4, weekend=1.1)
  
  
  genDaysFromRange <- function(startDate, endDate) {
    # This function creates a data frame where each row represents a day
    # (starting from 'startDate' and ending on 'endDate') containing the day
    # of the week, whether or not the day is a weekday or a weekend day, and
    # the number of nurses working that day. Using the value for number of
    # nurses that worked each day, later we will create a data frame to
    # represent each nurse's daily responses to the questions asked by the
    # survey, which we will ultimately return as the final data set.
    #
    # |    date    |  weekday | day |  type   | numNurses |
    # | 1998/03/08 |  Sunday  |  0  | weekend |     7     |
    # | 1998/03/09 |  Monday  |  1  | weekday |     9     |
    #                         etc...
  
    # Create column of dates
    eachDay <- data.frame(date=seq.Date(as.Date(startDate),
                                       as.Date(endDate), 
                                       by='day')
                         )
    # Create column identifying each date as 'Sunday', 'Monday', etc.
    eachDay$dayOfWeek <- weekdays(as.Date(eachDay$date))
    # Create column that identifies each day as 'weekday' or 'weekend', using
    # the value in the 'dayOfWeek' column to lookup whether or not the day is a
    # 'weekday' or 'weekend' day.
    typeOfDay <- c(Sunday='weekend',
                   Monday='weekday',
                   Tuesday='weekday',
                   Wednesday='weekday',
                   Thursday='weekday',
                   Friday='weekday',
                   Saturday='weekend')
    eachDay$typeOfDay <- typeOfDay[eachDay$dayOfWeek]

    # Create column containing number of nurses that worked that day, which
    # depends on whether or not the day is a 'weekday' or 'weekend' day.
    eachDay$numNurses <- NA
    for (w in c('weekday', 'weekend')) {
      # You need to get mean and STD of number of nurses using the variable
      # 'numNurses' and index it like: numNurses['weekday.mean'] or
      # numNurses['weekend.sd']. Build those index values first:
      mean <- paste(w, 'mean', sep='.')  # 'weekday.mean' or 'weekend.mean'
      sd <- paste(w, 'sd', sep='.')  # 'weekday.sd' or 'weekend.sd'
      # Pull out all 'weekday' or 'weekend' days, depending on which 'w' we
      # are on in the for loop, and add the number of nurses from a normal
      # distribution whose parameters have already been set in 'numNurses'.
      numDaysOfType <- sum(eachDay$typeOfDay == w)
      sampleNurses <- rnorm(n=numDaysOfType,
                            mean=numNurses[mean],
                            sd=numNurses[sd])
      sampleNurses <- as.integer(round(sampleNurses), digits=0)
      eachDay$numNurses[eachDay$typeOfDay == w] <- sampleNurses
    }
    eachDay
  }
  eachDay <- genDaysFromRange(startDate, endDate)
  
  #print(mean(eachDay$numNurses))
  #print(mean(eachDay$numNurses[eachDay$typeOfDay == 'weekday']))
  #print(mean(eachDay$numNurses[eachDay$typeOfDay == 'weekend']))
    
  expandRows <- function() {
    # This function takes the data frame generated earlier (which contains
    # the number of nurses working per day) and expands that rows so there is a
    # row for *each nurse* that worked *each day*. In other words, this
    # function will expand each day in N times, where N is the numNurses
    # that worked that day. These expanded rows will contain the daily responses
    # nurses enter into the system after they finish a shift.
    
    # Repeate each row "number_of_times=numNurses", taking columns 1 & 3, and
    # setting row.names to NULL:
    dataSet <- data.frame(eachDay[rep(c(1:nrow(eachDay)), eachDay$numNurses),
                                  c(1, 3, 4)],
                          row.names=NULL)
    # Set column headers of the expanded data frame
    names(dataSet) <- c('date', 'typeOfDay', 'numDailyStaffedNurses')
    dataSet
  }
  dataSet <- expandRows()

  setQualOfCareRating <- function() {
    # Creates a column containg Quality of Care ratings for 'weekday' and
    # 'weekend' days. Quality of Care on the weekend will generally be lower
    # because the number of nurses is lower. Quality of Care is rated by nurses
    # as Poor, Fair, Good, or Excellent, but here we will use 1-4 to represent
    # these values during data generation.
    
    dataSet$qualOfCare = NA
    for (w in c('weekday', 'weekend')) {
      rowsOfType <- dataSet$typeOfDay[dataSet$typeOfDay == w]
      qualRating <- sample(x=c(1:length(qualOfCareOptions)),
                           size=length(rowsOfType),
                           prob=as.numeric(unlist(qualOfCareProb[w])),
                           replace=T)
      dataSet$qualOfCare[dataSet$typeOfDay == w] <- qualRating
    }
    dataSet
  }
  dataSet <- setQualOfCareRating()
  
  #for (w in c('weekday', 'weekend')) {
  #  print(mean(dataSet$qualOfCare[dataSet$typeOfDay == w]))
  #  print(sd(dataSet$qualOfCare[dataSet$typeOfDay == w]))
  #  hist(dataSet$qualOfCare[dataSet$typeOfDay == w])
  #}

  relateQualOfCareToNumPatients <- function() {
    # Creates a column 'numPatientsCaredFor' which is linearly related to
    # qualOfCare. In the paper, the relationship between the two variables is
    # argued to be in the reverse (i.e. that Quality of Care rating depends on
    # Number of Patients). This is not being refuted, here, we are simply using
    # a reverse relationship to generate the data set. The linearly relationship
    # will exist no matter which variable we have depend on which, so it is up
    # to the analyst to interpret the direction of the relationship.
    
    linRelate <- function(x) {
      # The linear relationship to be applied to qualOfCare
      -1.76*x + 9 + rpois(1, lambda=2)
      # Adds some variability using Poisson distribution. With lambda=2, the
      # distribution should have mode=1, min=0, max=8, mean=2. The idea is that
      # on a given day a nurse could get overloaded by caring for more patients,
      # but the likelihood of getting overloaded by N patients decreases as N
      # increases.
      # Visualize: http://www.umass.edu/wsp/resources/poisson/
    }

    dataSet$patientWorkload <- NA
    for (w in c('weekday', 'weekend')) {
      rowsOfType <- dataSet$qualOfCare[dataSet$typeOfDay == w]
      dataSet$patientWorkload[dataSet$typeOfDay == w] <- vapply(
        rowsOfType,
        FUN=linRelate,
        FUN.VALUE=double(1)
      )
    }
    # Set the Patient Workload as an integer instead of a decimal value
    dataSet$patientWorkload <- as.integer(
      round(dataSet$patientWorkload, digits=0)
    )
    dataSet
  }
  dataSet <- relateQualOfCareToNumPatients()
  
  addEmployeeID <- function(){
    # Adds a column of employee IDs, where on the weekend certain employees are
    # more likely to work.
    
    # Number of employees should be greater than their maximum daily staff
    ids <- runif(max(dataSet$numDailyStaffedNurses) + 15, 0, 9000)
    ids <- paste0('00', as.integer(ids))  # Add 00s before ID for realism
    
    dataSet$employeeID <- NA
    
    # For every day, need to get a sample of employee IDs
    for (d in unique(dataSet$date)) {
      dailyResponses <- subset(dataSet, date == d)
      numResponses <- nrow(dailyResponses)
      typeOfDay <- dailyResponses$typeOfDay[1]
      
      # Sample the employee IDs using a custom probability distrubition on
      # the IDs. This makes some employees more likely to work the weekends, and
      # other employees never work the weekends:
      p <- rep(0, length(ids))
      p[1:2] <- 0.22
      p[3] <- 0.01
      p[4:6] <- 0.12
      p[7:9] <- 0.05
      p[10:11] <- 0.02
      if (typeOfDay == 'weekend') {
        idsList <- sample(x=ids,
                          size=numResponses,
                          replace=F,
                          prob=p)
      } else {
        # Otherwise, if it's a weekday get a random employee ID
        idsList <- sample(x=ids,
                          size=numResponses,
                          replace=F)
      }
      dataSet$employeeID[dataSet$date == d] <- idsList
    }
    dataSet
  }
  dataSet <- addEmployeeID()
  
  #hist(as.integer(dataSet$employeeID[dataSet$typeOfDay == 'weekday']))
  #hist(as.integer(dataSet$employeeID[dataSet$typeOfDay == 'weekend']))
  
  # Convert Quality of Care to "Poor", "Fair", etc.
  dataSet$qualOfCare <- cut(as.numeric(dataSet$qualOfCare), 4, c("Poor", "Fair", "Good", "Excellent"))
  
  # TODO: Add related survey question responses
  
  # Return the dataSet without typeOfDay
  data.frame(subset(dataSet, select=(c("date",
                                       "employeeID",
                                       "qualOfCare",
                                       "patientWorkload",
                                       "numDailyStaffedNurses")))
  )
}

analyzeDataSet <- function(dataSet) {
  m <- lm(dataSet$patientWorkload ~ dataSet$qualOfCare)
  print(summary(m))
}

dataSet <- generateDataSet(startDate="1998/03/08", endDate="2007/12/01")
analyzeDataSet(dataSet)

confound <- function(dataSet) {
  # Confound the dataSet by selecting a few employees who lie about the
  # quality of care their patients received because they are afraid of
  # repercussions from their manager. These employees always say Quality of Care
  # is Excellent.
  dishonestEmployees <- sample(unique(dataSet$employeeID), size=4, replace=F)
  s <- dataSet$employeeID %in% dishonestEmployees  # Get logical vector
  # Use logical vector to select rows and col
  dataSet[s, grep('qualOfCare', colnames(dataSet))] <- 4
  dataSet
}
dataSet <- confound(dataSet)
analyzeDataSet(dataSet)


