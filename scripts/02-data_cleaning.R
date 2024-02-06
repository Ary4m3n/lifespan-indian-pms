#### Preamble ####
# Purpose: Cleans the raw data and saves it to the cleaned_data.csv
# Author: Aryaman Sharma
# Date: 5 February 2024
# Contact: aryaman.sharma@mail.utoronto.ca
# License: MIT
# Pre-requisites: run the R script 01-download_data.R before running this script
# Any other information needed?: This is the second step after fulfilling the pre-requisites mentioned above.

#### Workspace setup ####
library(dplyr)
library(rvest)
library(tidyverse)
library(xml2)

raw_data <- read_html("inputs/data/raw_data.csv")

parse_data <-
  raw_data |>
  html_element(".wikitable") |>
  html_table()


parsed_data <-
  parse_data |>
  clean_names() |>
  rename(raw_text = name_born_died_constituency) |>
  select(raw_text) |>
  filter(raw_text != "Name(born – died)Constituency") |>
  distinct()


initial_clean <- 
  parsed_data |>
  separate(
    raw_text, into = c("Name", "other"), sep = "\\(", extra = "merge",
  ) |>
  mutate(date = str_extract(other, "[[:digit:]]{4}–[[:digit:]]{4}"),
         Born = str_extract(other, "born[[:space:]][[:digit:]]{4}")
         ) |>
  select(Name, date, Born)

cleaned_data <- 
  initial_clean |>
  separate(date, into = c("Birth", "Died"), sep = "–") |>
  mutate(
    Born = str_remove_all(Born, "born[[:space:]]"),
    Birth = if_else(!is.na(Born), Born, Birth)
  ) |>
  select(-Born) |>
  rename(Born = Birth) |> 
  mutate(across(c(Born, Died), as.integer)) |> 
  mutate(`Lifespan` = Died - Born)

#### Save data ####
write_csv(cleaned_data, "outputs/data/cleaned_data.csv")


