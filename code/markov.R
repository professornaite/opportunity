# Load required packages
install.packages("markovchain")
install.packages("tidyverse")
library(markovchain)
library(dplyr)
library(tidyverse)

# Set the seed for reproducibility
set.seed(987)

# Number of observations
n <- 100

# Create the race variable
race <- sample(c("Black", "White"), size = n, replace = TRUE, prob = c(0.3, 0.7))

# Print the summary of the race variable
summary(race)
race

# Create the income variable
income_cat <- sample(c("Lower", "Middle", "High"), size = n, replace = TRUE, prob = c(0.4, 0.5, 0.1))

# Print the summary of the income variable
summary(income_cat)
income_cat

# Create the numeric income variable based on the income category
income_num <- ifelse(income_cat == "Lower", 
                         sample(1000:30000, size = n, replace = TRUE), # placing people that make less than ~30K in the lower category
                         ifelse(income_cat == "Middle",
                                sample(30001:150000, size = n, replace = TRUE), # placing people that make less than 150K in the middle category
                                sample(150001:500000, size = n, replace = TRUE)))

# Print the summary of the numeric income variable
summary(income_num)

## here I create the data set which matches the categories for income to a numeric value
# Read the data into a data frame (replace 'data.csv' with your file name)
data <- data.frame(race, income_cat, income_num)
data
View(data)

# Subset the data to include only relevant columns (e.g., race and numeric income)
subset_data <- data %>% select(race, income_num)

# Create income quintiles based on income values
subset_data$quintile <- ntile(subset_data$income_num, 5)
str(subset_data)
subset_data$quintile <- as.character(subset_data$quintile)

plot(income_num)

# Create a transition matrix by race and income quintile
transition_matrix <- subset_data %>%
  group_by(race, quintile) %>%
  summarise(count = n()) %>%
  mutate(transition_prob = count / sum(count)) %>%
  select(race, quintile, transition_prob) %>%
  spread(key = quintile, value = transition_prob, fill = 0)

transition_matrix <- as.matrix(transition_matrix) 
##### NOTE: the code above is producing an error with the next line of code

# Create a Markov chain object
mc <- new("markovchain", states = unique(subset_data$quintile), transitionMatrix = transition_matrix)

# Print the transition matrix
print(mc)

# Perform any further analysis or calculations using the Markov chain model
# For example, you can calculate the steady-state distribution, simulate future states, etc.