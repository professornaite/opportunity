# markov chain simulation example

# install packages and load libraries
install.packages("expm")

library(expm)

# set seed for reproducibility
set.seed(1) # seed is set to experiment number

# define transition matrices, Q, of quintiles

q_black <- matrix(c(0.4, 0.3, 0.2, 0.1, 0.0,
                    0.0, 0.4, 0.3, 0.2, 0.1,
                    0.1, 0.0, 0.4, 0.3, 0.2,
                    0.2, 0.1, 0.0, 0.4, 0.3,
                    0.3, 0.2, 0.1, 0.0, 0.4), ncol = 5, byrow = T)

q_white <- matrix(c(.1, .1, .1, .3, .4,
                    

# create multi-step chain
q_black %^% 3 
# note: squaring a matrix using m^2 squares each value and not the matrix

# stationary distribution
q_black %^% 10000

# simulate model
steps <- 5
state <- 1
for (i in 1:steps) {
  
  # new state
  state_new <- sample(1:nrow(m),
                      size = 1,
                      prob = m[state[length(state)], ])
  
  # bind
  state <- c(state, state_new)
}

state
plot(state)
