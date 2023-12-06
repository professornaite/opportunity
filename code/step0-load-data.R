#### opportunity data prep
# info: https://opportunityinsights.org/data/?geographic_level=0&topic=0&paper_id=1652#resource-listing

### step 0: load and examine data

# load packages and libraries
install.packages("shiny")
install.packages("tidyverse")
install.packages("tidycensus")
install.packages("readxl")
library(shiny)
library(tidyverse)
library(dplyr)
library(tidycensus)
library(readxl)

  # special packages and libraries
  install.packages("expss") # variable labels and supports
  library(expss) # https://cran.r-project.org/web/packages/expss/vignettes/labels-support.html

# import data

## CENSUS - zip code tabulation area (ZCTA): 
## load data: https://www.census.gov/programs-surveys/geography/technical-documentation/records-layout/2010-zcta-record-layout.html
zcta_tract <- read.csv("https://www2.census.gov/geo/docs/maps-data/data/rel/zcta_tract_rel_10.txt") # read in tract data
  
  # apply labels (see https://www.census.gov/programs-surveys/geography/technical-documentation/records-layout/2010-zcta-record-layout.html#par_textimage_3)
  zcta_tract = apply_labels(zcta_tract,
                            ZCTA5 = "2010 ZIP Code Tabulation Area",
                            STATE = "2010 State FIPS Code",
                            COUNTY = "2010 County FIPS Code",
                            TRACT = "2010 Census Tract Code",
                            GEOID = "Concatenation of 2010 State, County, and Tract",
                            POPPT = "Calculated 2010 Population for the relationship record",
                            HUPT = "Calculated 2010 Housing Unit Count for the relationship record",
                            AREAPT = "Total Area for the record",
                            AREALANDPT = "Land Area for the record",
                            ZPOP = "2010 Population of the 2010 ZCTA",
                            ZHU = "2010 Housing Unit Count of the 2010 ZCTA",
                            ZAREA = "Total Area of the 2010 ZCTA",
                            ZAREALAND = "Total Land Area of the 2010 ZCTA",
                            TRPOP = "2010 Population of the 2010 Census Tract",
                            TRHU = "2010 Housing Unit Count of the 2010 Census Tract",
                            TRAREA = "Total Area of the 2010 Census Tract",
                            TRAREALAND = "Total Land Area of the 2010 Census Tract",
                            ZPOPPCT = "Percentage of Total Population of the 2010 ZCTA represented by the record",
                            ZHUPCT = "Percentage of Total Housing Unit Count of the 2010 ZCTA represented by the record",
                            ZAREAPCT = "Percentage of Total Area of the 2010 ZCTA represented by the record",
                            ZAREALANDPCT = "Percentage of Total Land Area of the 2010 ZCTA represented by the record",
                            TRPOPPCT = "Percentage of Total Population of the 2010 Census Tract represented by the record",
                            TRHUPCT = "Percentage of Total Housing Unit Count of the 2010 Census Tract represented by the record",
                            TRAREAPCT = "Percentage of Total Area of the 2010 Census Tract represented by the record",
                            TRAREALANDPCT = "Percentage of Total Land Area of the 2010 Census Tract represented by the record"
  )
  
  # examine data
  str(zcta_tract) # review the data structure and CHECK LABELS
  dim(zcta_tract) # check the dimensions of the data
  head(zcta_tract) # view head of data
  tail(zcta_tract) # view tail of data
  summary(zcta_tract) # gather a summary of the data

  # check data for missing values
  sapply(zcta_tract, function (x) sum(is.na(x)))

  # check unique values/data structure
  zcta_tract %>% 
    count(ZCTA5) # for 2010 ZIP Code Tabulation Area
  
  zcta_tract %>% 
    count(STATE) # for state
      # read in state FIPS codes 
      fips_codes # contains state, state_code, state_name, county_code, and county
      str(fips_codes) # check the structure of the data
      fips_codes <- as.tibble(fips_codes) # transform data frame to a tibble
      # add FIPS codes to zcta_tract
      fips_codes$state_code <- as.numeric(fips_codes$state_code) # transform state codes to numeric
      fips_codes$county_code <- as.numeric(fips_codes$county_code)
      str(fips_codes)
      
      # merging the data frames by county codes
      zcta_tract # check zcta frame; take note: 
      fips_codes
      df <- merge(zcta_tract, fips_codes, by.x = "COUNTY", by.y = "county_code")
      str(df)
      df %>% 
        relocate(ZCTA5, state_name, state_code, county, COUNTY) -> df
      head(df)
      tail(df)
  

      ## information on geoids: https://www.census.gov/programs-surveys/geography/guidance/geo-identifiers.html

#### CLEANING


#### DATA CHECK
