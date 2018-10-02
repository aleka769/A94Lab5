#' @title Function for retrieving stops close to given coordinates
#'
#' @param longitude Longitude coordinate according to WGS84-system
#' @param latitude Latitude coordinate according to WGS84-system
#' @param radius Radius from coordinates to search within, default = 1000m,
#'   accepted range is 50 - 9999m
#' @param max_locations Maximum number of matches to return, default = 5, 
#'   accepted range is 1 - 50.
#' @param api_key Key for the api.
#'
#' @return data.frame with stop-Id, extId, name, longitude and latitude (WGS84),
#'  weight (amount of trafic) and products (transportations available)
#' @references https://www.trafiklab.se/api/resrobot-reseplanerare/narliggande-hallplatser
#' @export
#'
# @examples head(nearby_stops(16.017, 58.571, radius = 2000))
nearby_stops <- function(longitude, latitude, api_key= "4f5c437f-3a02-4c5d-bfbb-f2fe042569ba", radius = 1000, max_locations = 5L){
  # Eror handling
  stopifnot(is.numeric(longitude) & is.numeric(latitude))
  stopifnot(is.numeric(radius) & is.numeric(max_locations))
  stopifnot(nchar(api_key) > 30 & nchar(api_key) < 40)
  # Make sure 50 <= radius <= 9999
  if(radius > 9999){
    warning("Radius too large, set to 9999m");    radius <- 9999;
    }
  if(radius < 50){
    warning("Radius too small, set to 50m");    radius <- 50;
    }
  # Make sure 1 <= max_location <= 50
  if(max_locations > 50){
    warning("Maximum of 50 locations will be returned");    max_locations <- 50;
    }
  if(max_locations < 1){
    warning("Atleast 1 location will be returned");    max_locations <- 1;
    }
  
  # Buildingblocks for query
  nearby_url <- "https://api.resrobot.se/v2/location.nearbystops.json?"
  nearby_q <- list(key = api_key,
                   originCoordLong = longitude,
                   originCoordLat = latitude,
                   r = radius,
                   maxNo = max_locations)
  
  # Query API and convert from JSON to data.frame
  stops <- jsonlite::fromJSON(httr::modify_url(url = nearby_url,
                                               query = nearby_q))
  # Stops if no results are returned
  if(length(stops) == 0){
    stop("\nNo results returned for your query.\n\nTry a larger radius or other coordinates!")
  }
  stops$StopLocation
}
