library(shiny)
library(shinythemes)
library(bslib)
library(dplyr)
library(readr)
library(plotly)
library(leaflet)
library(DT)
library(fresh)


theme <- create_theme(
  bs4dash_color(
    lime = "#52A1A5",
    olive = "#4A9094",
    purple = "#8965CD"
  ),
  bs4dash_status(
    primary = "#E1EDED",
    info = "#E4E4E4"
  )
)

df_piza <- gt::pizzaplace %>% 
  mutate(date_sold = readr::parse_date(date)) %>% 
  select(-c("date", "time"))