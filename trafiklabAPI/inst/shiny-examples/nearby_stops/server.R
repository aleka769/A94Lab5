# Define server logic required to draw a histogram
server <- (function(input, output) {
  requireNamespace("leaflet")
  requireNamespace("magrittr")
  hecrodIcon <- leaflet::makeIcon(
    iconUrl = system.file("hecrod.png",package="trafiklabAPI"),
    iconWidth = 40, iconHeight = 40,
    iconAnchorX = 22, iconAnchorY = 94
  )
  
  krzbarIcon <- leaflet::makeIcon(
    iconUrl = system.file("krzbar.png",package="trafiklabAPI"),
    iconWidth = 55, iconHeight = 65,
    iconAnchorX = 22, iconAnchorY = 94
  )
  
  # Waiting for the "update plot" button in shiny app
  observeEvent(input$act, {
    
    output$plot <- leaflet::renderLeaflet({
      
      # Calling API, '<<-' is used so that table 'your_loc' appears in shiny app
      your_loc <<- trafiklabAPI::nearby_stops(longitude = input$lon, 
                                              latitude  = input$lat, 
                                              radius    = isolate(input$r), 
                                              max_locations = isolate(input$no_stops))
      
      # Special icon for 'your location'
      icon.fa <- leaflet::makeAwesomeIcon(icon = krzbarIcon, spin = TRUE, library = "fa",
                                 markerColor = 'red', iconColor = 'black')
      
      # Draws map from 'your_loc' data.frame and adds special icon
      leaflet::leaflet(your_loc) %>% 
        leaflet::addMarkers(lng = ~lon, lat = ~lat, label = ~paste0(name," - ",dist,"m"), icon=hecrodIcon) %>% 
        leaflet::addMarkers(lng = ~input$lon, lat = ~input$lat, icon=krzbarIcon) %>%
        leaflet::addTiles()
    })
  })
  
  # Creates table in  shiny app
  output$table <- renderTable({
    your_loc[,c(3,4,5,7)]
  })
  
})