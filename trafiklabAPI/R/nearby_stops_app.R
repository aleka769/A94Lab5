#' Function for running shiny app based on nearby stops API
#'
#' @return nothing...
#' 
#' @export
nearby_stops_app <- function() {
  requireNamespace("shiny")
  requireNamespace("leaflet")
  appDir <- system.file("shiny-examples", "nearby_stops", package = "trafiklabAPI")
  if (appDir == "") {
    stop("Could not find example directory. Try re-installing `trafiklabAPI`.", call. = FALSE)
  }
  
  shiny::runApp(appDir, display.mode = "normal")
}