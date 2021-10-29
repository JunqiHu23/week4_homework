library(sf)
library(here)
library(tidyverse)

HDI <- read.csv(here('Data','Gender Inequality Index (GII).csv'),
                header = TRUE,
                sep = ",",
                skip = 5,
                na="..",
                encoding = "latin1")

World <- st_read(here('Data',
                      'World_Countries_(Generalized)',
                      'World_Countries__Generalized_.shp'))