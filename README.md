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


## renv
To ensure full reproducibility, this project uses the renv package to manage package versions. 
If you clone or download this repository, you should synchronize your local R package library with the project’s renv.lock file. 
This lockfile records the exact package versions used when the project was created. To restore the environment, simply run:
renv::restore()

## Docker image and automated report

This project includes a Docker image that can be used to reproduce the full analysis and report.

### Build the image locally

From the project root (the folder containing `Dockerfile`):

```bash
docker build -t sliu639/heart_project:v1 .
```