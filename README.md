# Reproducible Coding Assignment
This repository hosts the updated code produced for the Reproduble Coding course assignment.

## Description and Changes Made
This code runs an analysis on the Estimation of Obesity Levels Based On Eating Habits and Physical Condition dataset from the UC Irvine ML library.

Changes made to the assignment code:
1) Updated project structure to match package-ready structure: created .renvlock file, separated into a folder "R" with a script containing functions and a script with data processing, and a folder "scripts" with analysis_scripts, added README and LICENSE files.
2) Updated required packages and called specific functions directly from libraries.
3) Deleted redundant lines of code
4) Added informative comments and informative variable names
5) Updated loops in code to vectorised operations where possible.
6) Created functions for script sections which may be re-used. Included logging in functions.
7) Added tests in "tests" folder for testing three out of four functions.
8) Updated script using styler

## Getting Started

### Dependencies

* See .renvlock

### Executing program

* First run the script initialise_renv_lock to set up the environment.
* Then source analysis_functions.
* Then run data_processing script to download and process data.
* Then run regression_analysis script to generate model and plots.

## Help
Please open an issue in this repo if you encounter issues in running the script.

### Use of Generative AI
Github Copilot with the model Raptor mini was used within VS Code as part of this assignment. In-line suggestions were considered and implemented when applicable. Additionally, the chat function was used ask for advice, for example:

Could this code be made more efficient with vectorisation?
##convert binary columns to numeric values for modelling
binary_columns <- c(
  'family_history_with_overweight',
  'FAVC',
  'SMOKE',
  'SCC'
)
for (col in binary_columns) {
  survey_data[survey_data[[col]] == 'yes', col] <- '1'
  survey_data[survey_data[[col]] == 'no', col] <- '0'
  survey_data[[col]] <- as.numeric(survey_data[[col]])
}

### Adherence to FAIR practices
By hosting on Github with a clear README this code is findable and accessible once it is made public. The code is interoperable as dependencies are documented in the .lock file. It is reproducible as both the data and code are provided.

### Suggested Citation (Example)
Read, Christina. (2026). "Modeling Obesity and Lifestyle Factors". https://github.com/christinaread-umcu/ReproducibleCoding/.