library(tidyverse)
library(dslabs)
d <- read_csv("times.csv")

tidy_data <- d %>%
  pivot_longer('2015':'2017', names_to = "year", values_to = "time")

x <- tidy_data %>% pivot_wider(names_from = year, values_from = time)

tidy_data <- d %>%
  pivot_longer(age_group, names_to = "year", values_to = "time")

x <- co2

# Ansewer
co2_wide <- data.frame(matrix(co2, ncol = 12, byrow = TRUE)) %>% 
  setNames(1:12) %>%
  mutate(year = as.character(1959:1997))

co2_tidy <- pivot_longer(co2_wide, -year, names_to = "month", values_to = "co2")

co2_tidy %>% ggplot(aes(as.numeric(month), co2, color = year)) + geom_line()

data(admissions)
dat <- admissions %>% select(-applicants)
dat_tidy <- pivot_wider(dat, names_from = gender, values_from = admitted)

tmp <- gather(admissions, key, value, admitted:applicants)
tmp
tmp2 <- unite(tmp, column_name, c(gender, key))
