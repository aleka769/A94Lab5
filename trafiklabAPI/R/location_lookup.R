#' Function for doing lookup of place-names and return closest matching bus-stops
#'
#' @param location String to search for.
#' @param max_locations Maximum number of matches to return, default = 5, 
#'   accepted range 1-50.
#' @param api_key Key for the api.
#'
#' @return data.frame with stop-Id, extId, name, longitude and latitude (WGS84),
#'  weight (amount of trafic) and products (transportations available)
#' @references https://www.trafiklab.se/api/resrobot-reseplanerare/platsuppslag
#' @export
#'
#' @examples head(location_lookup("Universitetet",api_key = api_key))
location_lookup <- function(location, max_locations = 5L, api_key){
  # Error handling
  stopifnot(is.character(location) & nchar(location) > 0)
  stopifnot(is.numeric(max_locations))
  stopifnot(nchar(api_key) > 30 & nchar(api_key) < 40)
  # Make sure 1 <= max_location <= 50
  if(max_locations > 50){
    warning("Maximum of 50 locations will be returned");    max_locations <- 50;
  }
  if(max_locations < 1){
    warning("Atleast 1 location will be returned");    max_locations <- 1;
  }
  # Buildingblocks for query
  location_url <- "https://api.resrobot.se/v2/location.name.json?"
  location_q <- list(key = api_key,
                     input = location,
                     maxNo = max_locations)
  
  # Query API and convert from JSON to data.frame
  stops <- jsonlite::fromJSON(httr::modify_url(url = location_url,
                                               query = location_q))
  # Stops if no results are returned
  if(length(stops) == 0){
    stop("No results returned for your query.\n\nTry a larger radius or other coordinates!")
  }
  stops$StopLocation
}