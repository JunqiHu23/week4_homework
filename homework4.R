library(sf)
library(here)
library(tidyverse)
library(janitor)
library(countrycode)
library(tmap)

#read files
HDI <- read.csv(here('Data','Gender Inequality Index (GII).csv'),
                header = TRUE,
                sep = ",",
                skip = 5,
                na="..",
                nrows = 189,
                encoding = "latin1")

World <- st_read(here('Data',
                      'World_Countries_(Generalized)',
                      'World_Countries__Generalized_.shp'))

#join
HDI_data <- HDI %>%
  clean_names() %>%
  select(country,x2010,x2019) %>%
  mutate(diff=x2019-x2010) %>%
  mutate(ISO_code_HDI=countrycode(country,origin = "country.name",destination = 'iso3c'))

World_data <- World %>%
  clean_names() %>%
  mutate(ISO_code_World=countrycode(iso,origin = 'iso2c',destination = 'iso3c'))

Join_data <- World_data %>%
  clean_names() %>%
  left_join(.,
            HDI_data,
            by=c('ISO_code_World'='ISO_code_HDI'))


#map
tmap_mode("plot")
Join_data %>%
  qtm(.,fill = "diff")