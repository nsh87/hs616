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

##### Set Parameters #####

qualOfCare <- c("Poor", "Fair", "Good", "Excellent")

numRegisteredNurses <- c(weekday=1:9, weekend=1:20)

numPatientsCaredFor <- c(1:28)
numPatientsCaredForMean <- c(weekday=10.1, weekend=6.3)
numPatientsCaredForSTD <- c(weekday=2.4, weekend=3.4)

numTasksUndone <- c(0:7)
numTasksUndoneMean <- c(weekday=0.9, weekend=2.1)

numSafetyProbs <- c(0:4)
numSafetyProbsMean <- c(weekday=0.4, weekend=1.1)

startDate <- "1998/03/08"
endDate <- "2007/12/01"


