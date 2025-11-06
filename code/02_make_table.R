# code/02_make_table.R
# Create a descriptive summary table by outcome (hd)
suppressPackageStartupMessages({
  library(here)
  library(readr)
  library(dplyr)
})
here::i_am("code/02_make_table.R")
message("here() starts at: ", here::here())

in_rds <- here::here("output","clean_data.rds")
stopifnot(file.exists(in_rds))
dat <- readr::read_rds(in_rds)

# Numeric summaries by hd
num_vars <- c("age","trestbps","chol","thalach","oldpeak")
tbl_num <- dat |>
  group_by(hd) |>
  summarise(across(all_of(num_vars),
                   list(mean = ~mean(.x, na.rm=TRUE),
                        sd   = ~sd(.x, na.rm=TRUE)),
                   .names = "{.col}_{.fn}"),
            .groups = "drop")

# Simple categorical distribution examples
tbl_cat <- dat |>
  mutate(sex = factor(sex, labels = c("female","male"))) |>
  count(hd, sex) |>
  group_by(hd) |>
  mutate(p = 100*n/sum(n)) |>
  ungroup()

# Save
out_csv1 <- here::here("output","table_numeric_by_hd.csv")
out_csv2 <- here::here("output","table_sex_by_hd.csv")
readr::write_csv(tbl_num, out_csv1)
readr::write_csv(tbl_cat, out_csv2)
message("Saved: ", out_csv1, " and ", out_csv2)