#### Preamble ####
# Purpose: Simulates the data table shown in the inputs/sketches/dataset.pdf.
# Author: Aryaman Sharma
# Date: 5 February 2024
# Contact: aryaman.sharma@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed?: Run this script to get an idea of how the data tables will look like.

#### Workspace setup ####
library(tidyverse)
library(janitor)
library(randomNames)

#### Simulate data ####
# We set the seed here to help make this script reproducible
set.seed(43)

prime_minister_simulated <-
  tibble(
    prime_minister = randomNames(10), # used randomNames instead of baby names just to try out a different package
    birth_year = sample(1880:1950, size = 10, replace = TRUE),
    years_lived = sample(50:100, size = 10, replace = TRUE),
    death_year = birth_year + years_lived
  ) |>
  select(prime_minister, birth_year, death_year, years_lived) |>
  arrange(birth_year)


