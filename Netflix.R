# Load necessary libraries
library(tidyverse)
library(readr)
library(dplyr)
library(ggplot2)
library(summarytools)

# Load the data
data <- read_csv('data.csv')

# Inspect the data
print(dfSummary(data))

# Data Cleaning (example: handling missing values)
data <- data %>% drop_na()

# Exploratory Data Analysis (EDA)
# Population distribution by state
ggplot(data, aes(x = State_name, y = Population)) +
  geom_bar(stat = "identity") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(title = "Population Distribution by State", x = "State", y = "Population")

# Literacy rates by gender
ggplot(data, aes(x = State_name, y = Literate, fill = Gender)) +
  geom_bar(stat = "identity", position = "dodge") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(title = "Literacy Rates by Gender", x = "State", y = "Literate Population")

# Workforce participation rates
ggplot(data, aes(x = State_name, y = Workers)) +
  geom_bar(stat = "identity") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  labs(title = "Workforce Participation by State", x = "State", y = "Number of Workers")

# Advanced Analysis
# Correlation analysis
cor_data <- data %>% select(Population, Literate, Workers)
correlation_matrix <- cor(cor_data)
print(correlation_matrix)

# Save results
write.csv(correlation_matrix, 'correlation_matrix.csv')

# End of script
