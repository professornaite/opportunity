## Percentage distribution of household income in the United States in 2022, by race and ethnicity 

# source: https://www.statista.com/statistics/203207/percentage-distribution-of-household-income-in-the-us-by-ethnic-group/
# note: raw data required an account

r1 <- c("Annual household income in U.S. dollars", "White alone, not Hispanic",	"Black alone", "Asian alone", "Hispanic (any race)", "American Indian and Alaska Native")
c1 <- c("Under 15,000", 6.9,	13.7,	7.5, 9.8, 12.5)
c2 <- c("15,000 to 24,999",	7,	9.9,	4.7,	8.1,	10)
c3 <- c("25,000 to 34,999",	7.1,	10.3,	4.5,	8.9,	10.2)
c4 <- c("35,000 to 49,999",	9.9,	12.6,	6.9,	12.7,	14.3)
c5 <- c("50,000 to 74,999",	15.7,	18,	12,	18.5,	17.7)
c6 <- c("75,000 to 99,999",	12.4,	11.4,	10.4,	13.5,	13.2)
c7 <- c("100,000 to 149,999",	17.6,	11.9,	18.6,	14.7,	11)
c8 <- c("150,000 to 199,999",	10.1,	6,	12.4,	6.9,	5.4)
c9 <- c("200,000 and over",	13.4,	6,	23.1,	6.8,	5.6)
data <- data.frame(r1, c1, c2, c3, c4, c5, c6, c7, c8, c9)
data = t(data) # transpose data
View(data)
