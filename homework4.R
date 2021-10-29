library(sf)
library(here)
library(tidyverse)
HDI <- read.csv(here('Data','Gender Inequality Index (GII).csv'),
                skip = 5,
                na="..",
                encoding = "latin1",)