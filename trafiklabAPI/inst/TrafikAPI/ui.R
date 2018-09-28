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
  
  # App title ----
  titlePanel("Tabsets"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      numericInput("lon", "longitude:", 15.6, min = -180, max = 180),
      numericInput("lat", "latitude:", 58.41, min = -90, max = 90),
      
      # Input: Slider for the number of observations to generate ----
      sliderInput(inputId = "r",
                  label = "Search radius",
                  value = 500,
                  min = 1,
                  max = 9999)
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Tabset w/ plot, summary, and table ----
      tabsetPanel(type = "tabs",
                  tabPanel("Plot", leafletOutput("plot")),
                  p(),
                  tabPanel("Table", tableOutput("table"))
      )
      
    )
  )
)
