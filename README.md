# Lifespan of Indian Prime Ministers

## Note

No LLM was used for this report.

## Overview

This repo provides all the work and files used and created while writing the paper titled *An Analysis of the lifespan of Indian Prime Ministers*. To access the PDF of the paper you can find it in `outputs/paper` where it is named as `paper.pdf`. The File Structure Section outlines each directory and also all relevant material that they contain. Please go through the File Structure Section before accessing the repo to gain all the understanding needed.

To use this folder, click the green "Code" button", then "Download ZIP". The user can then move the folder around to wherever they want to work on it on their own computer.

The repo has been created in a reproducible way for as to allow users to access and reproduce the work easily. Happy Reading!

## File Structure

The repo has been structured in a way to make it accessible to the user. The repo is structured as:

-   `input/data` contains the data sources used in analysis including the raw data.
-   `input/sketches` contains two sketches for the dataset `dataset.pdf` and the graph `graphs.pdf` as reference to what is to be expected in the paper.
-   `outputs/data` contains the cleaned dataset that was constructed.
-   `outputs/paper` contains the files used to generate the paper, including the Quarto document, `paper.qmd`, the reference bibliography file, `references.bib` as well as the PDF of the paper, `paper.pdf`. 
-   `scripts` contains the R scripts used to simulate `00-simulate_data.R`, download `01-download_data.R`, clean `02-data_cleaning.R` and test data `03-test_data.R`. Kindly read the prerequisites in the R scripts' preamble to be able to reuse and run the code.
