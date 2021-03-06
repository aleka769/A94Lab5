% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/nearby_stops.R
\name{nearby_stops}
\alias{nearby_stops}
\title{Function for retrieving stops close to given coordinates}
\usage{
nearby_stops(longitude, latitude, api_key = Sys.getenv("trafiklab_key"),
  radius = 1000, max_locations = 5L)
}
\arguments{
\item{longitude}{Longitude coordinate according to WGS84-system}

\item{latitude}{Latitude coordinate according to WGS84-system}

\item{api_key}{Key for the api.}

\item{radius}{Radius from coordinates to search within, default = 1000m,
accepted range is 50 - 9999m}

\item{max_locations}{Maximum number of matches to return, default = 5, 
accepted range is 1 - 50.}
}
\value{
data.frame with stop-Id, extId, name, longitude and latitude (WGS84),
 weight (amount of trafic) and products (transportations available)
}
\description{
Function for retrieving stops close to given coordinates
}
\references{
https://www.trafiklab.se/api/resrobot-reseplanerare/narliggande-hallplatser
}
