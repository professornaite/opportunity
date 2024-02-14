# test models

# Define transition matrix
transition_matrix <- matrix(c(0.7, 0.2, 0.1,
                              0.3, 0.5, 0.2,
                              0.1, 0.3, 0.6), nrow = 3, byrow = TRUE)

# Define initial wealth distribution
initial_distribution <- c(0.4, 0.4, 0.2) # low, medium, high

# Number of time steps
num_steps <- 10

# Initialize matrix to store wealth distribution at each time step
wealth_distribution <- matrix(0, nrow = num_steps + 1, ncol = 3)
wealth_distribution[1, ] <- initial_distribution

# Simulate Markov chain
for (i in 2:(num_steps + 1)) {
  wealth_distribution[i, ] <- wealth_distribution[i - 1, ] %*% transition_matrix
}

# Print the wealth distribution at each time step
for (i in 1:(num_steps + 1)) {
  cat("Time Step", i - 1, ": ", "Low:", wealth_distribution[i, 1], 
      "Medium:", wealth_distribution[i, 2], "High:", wealth_distribution[i, 3], "\n")
}
