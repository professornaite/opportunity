#### Opportunity data analysis
# info: https://opportunityinsights.org/data/?geographic_level=0&topic=0&paper_id=1652#resource-listing

### step ?: shiny app

# generate psuedo data
race <- c("Black", "White", "Other")
quintiles <- c(1:5)
group = rep(LETTERS[1:4], each = 25)
df <- data.frame(race, quintiles)
