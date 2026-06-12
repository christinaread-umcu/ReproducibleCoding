# this file contains data download and processing scripts

library(httr)
library(readr)

# download and unzip data
data_url <- "https://archive.ics.uci.edu/static/public/544/estimation+of+obesity+levels+based+on+eating+habits+and+physical+condition.zip"
tmp <- httr::GET(data_url, write_disk("data/data.zip", overwrite = TRUE))
httr::stop_for_status(tmp)
unzip("data/data.zip", exdir = "data")

full_data <- readr::read_csv("data/ObesityDataSet_raw_and_data_sinthetic.csv", show_col_types = FALSE)

# select only data from the original survey for analysis
survey_data <- full_data[1:498, ]

## create BMI variable based on standard formula
survey_data$BMI <- calculate_bmi(survey_data$Weight, survey_data$Height)

# label data based on standard BMI thresholds
survey_data$label <- as.character(cut(
  survey_data$BMI,
  breaks = c(-Inf, 18.5, 25, 30, Inf),
  labels = c("0_underweight", "1_normal", "2_overweight", "3_obese"),
  right = FALSE
))

## differentiate active and passive transport with 0/1 for modelling
survey_data$MTRANS[survey_data$MTRANS == "Walking"] <- 1
survey_data$MTRANS[survey_data$MTRANS == "Bike"] <- 1
survey_data$MTRANS[survey_data$MTRANS == "Public_Transportation"] <- 0
survey_data$MTRANS[survey_data$MTRANS == "Automobile"] <- 0
survey_data$MTRANS[survey_data$MTRANS == "Motorbike"] <- 0
survey_data$MTRANS <- as.numeric(survey_data$MTRANS)

## convert gender to numeric values for modelling
survey_data$Gender[survey_data$Gender == "Male"] <- 1
survey_data$Gender[survey_data$Gender == "Female"] <- 0
survey_data$Gender <- as.numeric(survey_data$Gender)

## convert binary columns to numeric values for modelling
binary_columns <- c("family_history_with_overweight", "FAVC", "SMOKE", "SCC")
survey_data <- convert_binary_columns(survey_data, binary_columns)

## convert ordinal columns to numeric values for modelling
ordinal_columns <- c("CAEC", "CALC")
survey_data <- convert_ordinal_columns(survey_data, ordinal_columns)