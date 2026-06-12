# Reproducible Coding Assignment

This repository contains the code, data, and environment configuration for the obesity prediction assignment using the UCI "Estimation of Obesity Levels Based On Eating Habits and Physical Condition" dataset.

## Repository structure

- `data/`
  - `ObesityDataSet_raw_and_data_sinthetic.csv`: dataset used for analysis.
- `R/`
  - `analysis_functions.R`: reusable functions for data cleaning, transformation, and modeling.
  - `data_processing.R`: data import, preprocessing, and feature engineering.
- `scripts/`
  - `initialise_renv_lock.R`: initializes the project environment using `renv`.
  - `regression_analysis.R`: runs regression modeling and generates outputs.
- `tests/`
  - `test_that.R`: unit tests for core functions.
- `renv.lock`: locked package environment for reproducible dependency management.

## Description

The analysis prepares the obesity dataset, converts categorical features into modeling-friendly forms, and fits a regression model to explore relationships between lifestyle factors and obesity levels.

## Setup

1. Open the project in RStudio or VSCode.
2. Restore the project dependencies using `renv`:
   - run script: `/initialise_renv_lock.R`
3. Verify that `renv` has successfully installed the required packages.
4. Source functions
   - source script: `("R/data_processing.R")`

## Data Processing
1. Run script:
   - `("R/data_processing.R")`

## Run the analysis
1. Run analysis script:
   - `("scripts/regression_analysis.R")`

## Run tests
Run:
- `Rscript -e "testthat::test_dir('tests')"`

## Use of Generative AI

GitHub Copilot with the model Raptor mini (Preview) was used during development to suggest code improvements and assist with formatting. n-line suggestions were considered and implemented when applicable. Additionally, the chat function was used ask for advice, for example:

Could this code be made more efficient with vectorisation? ##convert binary columns to numeric values for modelling binary_columns <- c( 'family_history_with_overweight', 'FAVC', 'SMOKE', 'SCC' ) for (col in binary_columns) { survey_data[survey_data[[col]] == 'yes', col] <- '1' survey_data[survey_data[[col]] == 'no', col] <- '0' survey_data[[col]] <- as.numeric(survey_data[[col]]) }

### Adherence to FAIR practices

By hosting on Github with a clear README this code is findable and accessible once it is made public. The code is interoperable as dependencies are documented in the .lock file. It is reproducible as both the data and code are provided.

### Suggested Citation (Example)
Read, Christina. (2026). "Modeling Obesity and Lifestyle Factors". https://github.com/christinaread-umcu/ReproducibleCoding/.