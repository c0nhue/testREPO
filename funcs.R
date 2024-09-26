library(tidyverse)
library(dplyr)
view(starwars)
select(starwars, name, species, height, mass)
arrange(starwars, mass)
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
