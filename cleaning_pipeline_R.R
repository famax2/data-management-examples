# Cleaning Pipeline in R
library(data.table)
library(dplyr)

# Read data
dt <- fread("data.csv")

# Cleaning steps
dt_clean <- dt %>%
  mutate(across(everything(), ~ trimws(tolower(as.character(.))))) %>%
  distinct() %>%
  mutate(age = ifelse(is.na(age), median(age, na.rm = TRUE), age))

# Save cleaned dataset
fwrite(dt_clean, "cleaned_data.csv")
