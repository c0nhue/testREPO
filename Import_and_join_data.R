library(tidyverse)
library(janitor)
library(readxl)

tube <- read_csv("data/tube-station-comma.csv", show_col_types = FALSE) %>%
  clean_names()
names(tube)


food <- read_excel("data/favourite-food.xlsx", na = c("N/A", "99999")) %>%
  clean_names() %>%
  mutate(age = if_else(age == "five", "5", age),
         age = as.numeric(age),
         ses = fct_relevel(ses, "Low", "Middle", "High"))
food  

write_rds(food, "data/food-clean.rds")


enrolment <- read_csv("data/students/enrolment.csv")
survey <- read_csv("data/students/survey.csv")

enrolment %>% 
  left_join(survey, by = "id")

customers <- read_csv("data/customers.csv")
purchases <- customers %>%
  pivot_longer(
    cols = item_1:item_3,  # variables item_1 to item_3
    names_to = "item_no",  # column names -> new column called item_no
    values_to = "item"     # values in columns -> new column called item
  )
purchases
