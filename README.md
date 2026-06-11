# Reproducible Coding Assignment
This repository hosts the updated code produced for the Reproduble Coding course assignment.

## Description and Changes Made
This code runs an analysis on the Estimation of Obesity Levels Based On Eating Habits and Physical Condition dataset from the UC Irvine ML library.

Changes made to the assignment code:
1) Updated project structure to match package-ready structure: created .renvlock file, separated into a folder "R" with a script containing functions and a script with data processing, and a folder "scripts" with analysis_scripts, added README and LICENSE files.
2) Updated required packages and called specific functions directly from libraries.
3) Deleted redundant lines of code
4) Added informative comments and informative variable names.
5) Updated loops in code to vectorised operations where possible.
6) Created functions for script sections which may be re-used. Included logging in functions.
7) Added tests in "tests" folder for testing functions.
8) Updated script using styler.

## Getting Started

### Dependencies

* See .renvlock

### Executing program

* First source analysis functions.
* Then run data_processing script to download and process data.
* Then run regression_analysis script to generate model and plots.

## Help
Please open an issue in this repo if you encounter issues in running the script.
