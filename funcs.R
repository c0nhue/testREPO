library(tidyverse)
library(dplyr)

cat_lovers <- read_csv("data/cat-lovers.csv")
cat_lovers
view(cat_lovers)

# piping
cat_lovers %>%
  mutate(
    number_of_cats = case_when(
      name == "Ginger Clark" ~ "2",
      name == "Doug Bass" ~ "3",
      TRUE ~ number_of_cats
    ),
    number_of_cats = as.numeric(number_of_cats) # convert chr to int
  ) %>%
  summarise(mean_cats = mean(number_of_cats))


view(starwars)
select(starwars, name, species, height, mass)
slice(starwars, 1:4)
filter(starwars, homeworld == "Naboo")


# piping
starwars %>%
  select(species, height) %>%
  mutate(species_group = case_when(
    species == "Droid" ~ "Droid",
    species == "Human" ~ "Human",
    TRUE ~ "Other")) %>%
  group_by(species_group) %>% 
  summarise(
    count = n(),
    avg_height = mean(height, na.rm=TRUE)
  )

#piping
starwars %>%
  select(homeworld, mass) %>%
  mutate(homeworld_group = case_when(
    homeworld == "Naboo" ~ "Naboo",
    homeworld == "Tatooine" ~ "Tatooine",
    homeworld == "Alderaan" ~ "Alderaan",
    TRUE ~ "Other")) %>%
  group_by(homeworld_group) %>%
  summarise(
    count = n(),
    avg_mass = mean(mass, na.rm=TRUE),
    min_mass = min(mass, na.rm=TRUE),
    max_mass = max(mass, na.rm=TRUE)
  )
