# Load packages
library(dplyr)
library(tidyr)
library(magrittr)

# Read in Unit_RAFM_Input
unit_data <- read.csv("unit_data.csv", stringsAsFactors=FALSE)

# Select required columns
unit_data_work <- unit_data %>%
    select(contains("fund"), contains("units"))

# Tidy data
fund_tidy <- unit_data_work %>% gather(key = "fund_name", value = "funds", contains("fund")) %>% select(fund_name, funds)

unit_tidy <- unit_data_work %>% gather(key = "unit_name", value = "units", contains("unit")) %>% select(unit_name, units)

unit_data_tidy <- data.frame(funds = fund_tidy$funds, units = unit_tidy$units)

# Group and summarise data
unit_data_summarise <- unit_data_tidy %>%
    group_by(funds) %>%
    summarise(units_sum = sum(units))

# Export data
write.csv(unit_data_summarise, file = "unit_data_summary", row.names = FALSE)


    
                    
                        
    
