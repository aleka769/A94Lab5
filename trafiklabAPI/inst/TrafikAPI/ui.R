#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

ui <- fluidPage(
  
  # App title
  titlePanel("Tabsets"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Longitude search, default is 15.6, can be changed in shiny app
      numericInput("lon", "longitude:", 15.6, min = -180, max = 180),
      
      # Latitude search, default is 58.41, can be changed in shiny app
      numericInput("lat", "latitude:", 58.41, min = -90, max = 90),
      
      # Search radius, default is 1000m, does not change zoom of map
      numericInput("r", label = "Search radius", value = 1000, min = 100, max = 9999),
      
      # Slider for number of stops to search, default is 5.
      sliderInput(inputId = "no_stops", label = "Number of stops to search",
                  value = 5, min = 1, max = 15),
      
      # Adds an action button to trigger code chunks. Limits no of calls to API(!)
      actionButton("act", "Update plot!")
      
    ),
    
    # Main panel for displaying outputs
    mainPanel(
      
      # Output: Tabset w/ leaflet plot and info-table for stops
      tabsetPanel(type = "tabs",
                  tabPanel("Plot", leafletOutput("plot")),
                  p(),
                  tabPanel("Table", tableOutput("table"))
      )
    )
  )
)
