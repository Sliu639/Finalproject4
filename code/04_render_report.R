# code/04_render_report.R
suppressPackageStartupMessages({
  library(here)
  library(rmarkdown)
})
here::i_am("code/04_render_report.R")
message("here() starts at: ", here::here())

in_rmd <- here::here("report","report.Rmd")
out_html <- here::here("report","report.html")
rmarkdown::render(input = in_rmd, output_file = out_html, envir = new.env())
message("Rendered: ", out_html)