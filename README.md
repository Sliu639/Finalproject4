# DATA 550 Final Project — Heart Disease

This repository organizes a minimal, reproducible workflow for analyzing the UCI Heart Disease (Cleveland) dataset.

## Structure
```
.
├── code/
│   ├── 01_load_data.R        # load & clean processed.cleveland.data -> output/clean_data.rds
│   ├── 02_make_table.R       # create descriptive tables -> output/table_*.csv
│   ├── 03_make_figure.R      # create figures -> output/fig_*.png
│   └── 04_render_report.R    # render report/report.html
├── data/
│   └── processed.cleveland.data
├── output/
│   └── .gitkeep
├── report/
│   └── report.Rmd
├── .gitignore
├── Makefile
└── README.md
```

## Build the Final Report
One command:
```bash
make
```
This will generate **`report/report.html`** by running the scripts in order.

Run step-by-step in R:
```r
source("code/01_load_data.R")
source("code/02_make_table.R")
source("code/03_make_figure.R")
source("code/04_render_report.R")
```

## Where is the code for the required **table**?
- `code/02_make_table.R` outputs `output/table_numeric_by_hd.csv` and `output/table_sex_by_hd.csv`.

## Where is the code for the required **figure**?
- `code/03_make_figure.R` outputs `output/fig_chol_age_hd.png` and `output/fig_bp_hd.png`.

## Notes
- All paths use **`here::here()`**; each script prints its project root.