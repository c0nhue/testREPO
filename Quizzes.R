library(tidyverse)
us_rent_income %>% head(n = 10)
help('us_rent_income')

us_rent_income %>%
 filter(variable == "income") %>%
 summarise(avg = mean(estimate, na.rm=TRUE))


us_rent_income %>%
  filter(variable == "rent") %>%
  summarise(avg = mean(estimate, na.rm=TRUE))


us_rent_income %>%
  filter(variable == "rent") %>%
  summarise(avg = mean(moe, na.rm=TRUE))


us_rent_income %>%
  filter(variable == "income") %>%
  summarise(avg = mean(moe, na.rm=TRUE))


my_list <- list(
  item1 = seq(from = 0, to = 10, by = 2),
  item2 = c("variable", "estimate", "moe"),
  item3 = c(TRUE, FALSE),
  item4 = diag(3)
)
