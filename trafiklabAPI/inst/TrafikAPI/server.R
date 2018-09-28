#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
Sys.setenv("MAPBOX" = "pk.eyJ1IjoibGFsdXNoIiwiYSI6ImNqbWI4aXZsYjAzYjYzd3Fta3BwaGdzYWQifQ.KHIChvzFKOXg--KmQexTTQ")
load("X:/LABS/Advanced R/Lab5/A94Lab5/api_tests.RData")

library(shiny)
library(plotly)
library(magrittr)
library(leaflet)

# df <- data.frame(longitude = runif(10, -97.365268, -97.356546), 
#                  latitude = runif(10, 32.706071, 32.712210))
# 
# coordinates(df) <- ~longitude+latitude
# 
# leaflet(df) %>% addMarkers() %>% addTiles()

# Define server logic required to draw a histogram
server <- (function(input, output) {
  
  
  
  Sys.setenv("MAPBOX" = "pk.eyJ1IjoibGFsdXNoIiwiYSI6ImNqbWI4aXZsYjAzYjYzd3Fta3BwaGdzYWQifQ.KHIChvzFKOXg--KmQexTTQ")  
  output$plot <- renderLeaflet({
    # liu_lkpg
    icon.fa <- makeAwesomeIcon(icon = 'flag', 
                               markerColor = 'red', iconColor = 'black')
    
    # coordinates(liu_lkpg) <- ~lon+lat 
    leaflet(liu_lkpg) %>% 
      addMarkers(lng = ~lon, lat = ~lat) %>% 
      addAwesomeMarkers(lng = ~input$lon, lat = ~input$lat,
                        icon = icon.fa) %>%
      addTiles()
    
    # plot_geo(liu_lkpg) %>%
    #   add_markers(x = ~lon, y = ~lat,
    #               # text = ~paste("Hallplatsnamn:", ~name),
    #               hoverinfo = "text") %>%
    #   layout(geo = list(zoom = 10, center = list(lon = ~lon, lat = ~lat),
    #                     scope = "Europe"),
    #          title = "Number of mosquito detections in an 0.6x0.4 long/lat square")
    
  })
  
  output$table <- renderTable({
    hallplatser$falla$r <- input$r
    hallplatser$falla
  })
  
})

shinyApp(ui, server)
