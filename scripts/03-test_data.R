#### Preamble ####
# Purpose: Tests for the cleaned dataset to check if the requirements match that of the simulated data.
# Author: Aryaman Sharma
# Date: 5 February 2024
# Contact: aryaman.sharma@mail.utoronto.ca
# License: MIT
# Pre-requisites: Kindly run 00-simulate_data.R, 01-download_data.R, and 02-data_cleaning.R before running this file (in specific the latter two).

#### Workspace setup ####
library(tidyverse)
library(dplyr)

#### Test data ####
# Here we assign cleaned_data to the data that we cleaned in 02-data_cleaning.R
cleaned_data <-read_csv("outputs/data/cleaned_data.csv")
cleaned_data

# First test is to check if the years died in start from 1947, i.e. after the first PM was appointed
no_na_died <- subset(cleaned_data, !is.na(Died))
no_na$Died |>
  min() >= 1947

# Second test is to check if the Lifespan is positive
no_na_lifespan <- subset(cleaned_data, !is.na(Lifespan))
no_na_lifespan$Lifespan |>
  min() > 0

# Third test is to check if there are 15 columns for the 14 prime ministers that India has had + 1 i.e. the interim PM
cleaned_data$Name |>
  unique() |>
  length() == 15

