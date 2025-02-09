file_list <- list.files("~/Desktop/Data Wrangling/archive-2", 
                        pattern = ".csv", all.files = TRUE, full.names = TRUE)
# Used lapply to apply the read.csv to all the 10 csv files to read them into a set
killer_set <- lapply(file_list, read.csv)

serial_killer <- do.call(rbind, killer_set)

serial_killer[c('year_start', 'year_end')] <- str_split_fixed(serial_killer$Years.active, " to ", 2)

str(serial_killer)

countries <- c("(United) (States)", 
               "(United) (Kingdom)", 
               "(Ottoman) (Empire)", 
               "(South) (Korea)", 
               "(Kingdom) (of) (Romania)",
               "(Soviet) (Union)",
               "(South) (Africa)",
               "(Costa) (Rica)",
               "(West) (Germany)",
               "(East) (Germany)", 
               "(German) (Empire)",
               "(Allied-occupied) (Germany)")

for(i in countries) {
  serial_killer$Country <- gsub(
    i, 
    "\\1_\\2_\\3", 
    serial_killer$Country)
}

serial_killer$year_start <- stringr::str_extract(serial_killer$year_start, "[0-9]+")
serial_killer$year_end <- stringr::str_extract(serial_killer$year_end, "[0-9]+")

serial_killer$year_start <- as.numeric(serial_killer$year_start)
serial_killer$year_end <- as.numeric(serial_killer$year_end)

serial_killer$Country <- gsub(" \\(suspected\\)| \\(claimed\\)| \\(alleged\\)", "", 
                              serial_killer$Country)
serial_killer$Country <- gsub("Allied-occupied_Germany_", "", serial_killer$Country)
serial_killer$Country <- gsub("West_Germany_|East_Germany", "Germany", serial_killer$Country)
serial_killer$Country <- gsub("German_Empire_", "", serial_killer$Country)

library(dplyr)
library(tidyr)
library(stringi)
library(stringr)


serial_killer <- tidyr::separate_wider_delim(data = serial_killer, 
                            cols = Country, delim = "\n", 
                            names = paste0("country_", 1:6), 
                            too_few = "align_start")

cleaned_serial_killer <- serial_killer %>% separate_rows(Country, sep = "\n", convert = TRUE)

#structure x and y, then what you want to split 
#have to use \\ - means look for a bar, an actaul bar 


serial_killer <- serial_killer %>%
  mutate(
    proven.min = str_extract(Proven.victims, "^\\d+")) %>%
  # Clean up any non-digit characters like '+' from both columns
  mutate(
    proven.min = as.numeric(str_remove_all(proven.min, "\\D")))


str(serial_killer)

serial_killer <- serial_killer[, -15]

library(stringr)

# str_count counts how many times the word experience shows in each of the review

cleaned_serial_killer$stabbing_count <- str_count(cleaned_serial_killer$Notes, "[Ss]tab[bing]")
cleaned_serial_killer$executed <- str_count(cleaned_serial_killer$Notes, "[Ee]xecuted")

cleaned_serial_killer[275, 7] <- 1983
cleaned_serial_killer[275, 8] <- 1983

cleaned_serial_killer$active_years <- cleaned_serial_killer$year_end - cleaned_serial_killer$year_start

sum(cleaned_serial_killer$executed)

serial_killer$count <- 1
serial_killer$count <- as.numeric(serial_killer$count)

write.csv(cleaned_serial_killer, file = '~/Downloads/serial_killer.csv', row.names = FALSE)

write.csv(serial_killer, file = '~/Downloads/number_serial_killer.csv', row.names = FALSE)

