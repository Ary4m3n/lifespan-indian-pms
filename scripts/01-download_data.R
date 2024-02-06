#### Preamble ####
# Purpose: Downloads and saves the data from the wikipedia page
# Author: Aryaman Sharma
# Date: 5 February 2024
# Contact: aryaman.sharma@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed?: This is the first step towards downloading the raw data

#### Workspace setup ####
library(rvest)
library(tidyverse)
library(xml2)

#### Download data ####
raw_data <- 
  read_html(
    "https://en.wikipedia.org/wiki/List_of_prime_ministers_of_India"
  )
write_html(raw_data, "inputs/data/raw_data.csv")
