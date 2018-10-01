ui <- fluidPage(
  
  # Sidebar title for shiny app
  titlePanel("Bus stop options"),
  
  # Sidebar layout with input and output definitions
  sidebarLayout(
    
    # Sidebar panel for inputs
    sidebarPanel(
      
      # Longitude search, default is LiU can be changed in shiny app
      numericInput("lon", "longitude:", 15.576, min = -180, max = 180),
      
      # Latitude search, default is LiU, can be changed in shiny app
      numericInput("lat", "latitude:", 58.398, min = -90, max = 90),
      
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
