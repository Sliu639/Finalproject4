# code/03_make_figure.R
# Make figure(s) for the report
suppressPackageStartupMessages({
  library(here)
  library(readr)
  library(ggplot2)
  library(dplyr)
})
here::i_am("code/03_make_figure.R")
message("here() starts at: ", here::here())

in_rds <- here::here("output","clean_data.rds")
stopifnot(file.exists(in_rds))
dat <- readr::read_rds(in_rds)

# Scatter: cholesterol vs age, colored by heart disease
p1 <- ggplot(dat, aes(x = age, y = chol, color = factor(hd))) +
  geom_point(alpha = 0.7) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Cholesterol vs Age by Heart Disease",
       x = "Age", y = "Cholesterol (mg/dl)", color = "Heart Disease")

fig1 <- here::here("output","fig_chol_age_hd.png")
ggsave(fig1, p1, width = 7, height = 5, dpi = 150)

# Boxplot: resting blood pressure by hd
p2 <- ggplot(dat, aes(x = factor(hd), y = trestbps)) +
  geom_boxplot() +
  labs(title = "Resting Blood Pressure by Heart Disease",
       x = "Heart Disease (0=no, 1=yes)", y = "Resting BP (mm Hg)")

fig2 <- here::here("output","fig_bp_hd.png")
ggsave(fig2, p2, width = 7, height = 5, dpi = 150)

message("Saved: ", fig1, " and ", fig2)