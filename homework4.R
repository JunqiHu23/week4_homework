library(sf)
library(here)
library(tidyverse)
HDI <- read.csv(here('Data','Gender Inequality Index (GII).csv'),
                header = TRUE,
                sep = ",",
                skip = 5,
                na="..",
                encoding = "latin1"
                )