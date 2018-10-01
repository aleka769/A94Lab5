# Define server logic required to draw a histogram
server <- (function(input, output) {
  requireNamespace("leaflet")

  # Waiting for the "update plot" button in shiny app
  observeEvent(input$act, {
    
    output$plot <- leaflet::renderLeaflet({
      
      # Calling API, '<<-' is used so that table 'your_loc' appears in shiny app
      your_loc <<- trafiklabAPI::nearby_stops(longitude = input$lon, 
                                              latitude  = input$lat, 
                                              radius    = isolate(input$r), 
                                              # api_key   = api_key,
                                              max_locations = isolate(input$no_stops))
      
      # Special icon for 'your location'
      icon.fa <- makeAwesomeIcon(icon = 'flag', spin = FALSE, library = "fa",
                                 markerColor = 'red', iconColor = 'black')
      
      # Draws map from 'your_loc' data.frame and adds special icon
      leaflet(your_loc) %>% 
        addMarkers(lng = ~lon, lat = ~lat, label = ~paste0(name," - ",dist,"m")) %>% 
        addAwesomeMarkers(lng = ~input$lon, lat = ~input$lat,
                          icon = icon.fa) %>%
        addTiles()
    })
  })
  
  # Creates table in  shiny app
  output$table <- renderTable({
    your_loc[,c(3,4,5,7)]
  })
  
})