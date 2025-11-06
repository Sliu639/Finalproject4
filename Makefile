.PHONY: all clean

all: report/report.html

report/report.html: output/table_numeric_by_hd.csv output/table_sex_by_hd.csv output/fig_chol_age_hd.png output/fig_bp_hd.png report/report.Rmd code/04_render_report.R
	Rscript code/04_render_report.R

output/table_numeric_by_hd.csv output/table_sex_by_hd.csv: output/clean_data.rds code/02_make_table.R
	Rscript code/02_make_table.R

output/fig_chol_age_hd.png output/fig_bp_hd.png: output/clean_data.rds code/03_make_figure.R
	Rscript code/03_make_figure.R

output/clean_data.rds: data/processed.cleveland.data code/01_load_data.R
	Rscript code/01_load_data.R

clean:
	rm -f output/*.rds output/*.csv output/*.png report/report.html