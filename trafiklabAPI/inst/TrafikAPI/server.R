library(shiny)
library(plotly)
library(magrittr)
library(leaflet)

# Hector icon, will appear at (lat, lon) specified in function input !!UNDER PROGRESS!!
hecrodIcon <- makeIcon(
  iconUrl = "https://github.com/aleka769/A94Lab5/blob/master/trafiklabAPI/img/hecrod.png",
  iconWidth = 38, iconHeight = 95,
  iconAnchorX = 22, iconAnchorY = 94
)

# Krzysztof icon, will appear at (lat, lon) specified in function input  !!UNDER PROGRESS!!
krzbarIcon <- makeIcon(
  iconUrl = "https://github.com/aleka769/A94Lab5/blob/master/trafiklabAPI/img/krzbar.png",
  iconWidth = 38, iconHeight = 95,
  iconAnchorX = 22, iconAnchorY = 94
)


# Define server logic required to draw a histogram
server <- (function(input, output) {
  
  # Waiting for the "update plot" button in shiny app
  observeEvent(input$act, {
    
    output$plot <- renderLeaflet({
      
      # Calling API, '<<-' is used so that table 'your_loc' appears in shiny app
      your_loc <<- nearby_stops(longitude = input$lon, 
                               latitude  = input$lat, 
                               radius    = isolate(input$r), 
                               api_key   = api_key,
                               max_locations = isolate(input$no_stops))
      
      # Special icon for 'your location'
      icon.fa <- makeAwesomeIcon(icon = 'flag', spin = TRUE, library = "fa",
                                 markerColor = 'red', iconColor = 'black')
      
      # Draws map from 'your_loc' data.frame and adds special icon
      leaflet(your_loc) %>% 
        addMarkers(lng = ~lon, lat = ~lat) %>% 
        addAwesomeMarkers(lng = ~input$lon, lat = ~input$lat,
                          icon = icon.fa) %>%
        addTiles()
    })
  })
  
  # Creates table in  shiny app
  output$table <- renderTable({
    your_loc
  })
  
})

shinyApp(ui, server)
