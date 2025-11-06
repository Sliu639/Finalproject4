# code/01_load_data.R
# Load and clean UCI Heart Disease (processed.cleveland.data)
suppressPackageStartupMessages({
  library(here)
  library(readr)
  library(dplyr)
  library(here)
})
here::i_am("code/01_load_data.R")
message("here() starts at: ", here::here()) # "here i am"

# Column names from UCI description
col_names <- c("age","sex","cp","trestbps","chol","fbs","restecg",
               "thalach","exang","oldpeak","slope","ca","thal","num")

raw_path <- here::here("data","processed.cleveland.data")
df <- readr::read_csv(raw_path, col_names = col_names, na = "?", show_col_types = FALSE)

# Clean types
num_vars <- c("age","cp","trestbps","chol","fbs","restecg","thalach",
              "exang","oldpeak","slope","ca","thal","num","sex")
df <- df |> mutate(across(all_of(num_vars), as.numeric))

# Binary outcome: any heart disease (num > 0)
df <- df |> mutate(hd = if_else(num > 0, 1L, 0L))

# Keep commonly used variables
keep <- c("age","sex","cp","trestbps","chol","fbs","restecg",
          "thalach","exang","oldpeak","slope","ca","thal","hd")
clean <- df |> select(all_of(keep))

out_rds <- here::here("output","clean_data.rds")
readr::write_rds(clean, out_rds)
message("Saved: ", out_rds)