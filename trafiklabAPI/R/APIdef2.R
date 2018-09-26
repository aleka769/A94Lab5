pre_key = "https://api.resrobot.se/v2/location.nearbystops?key="
API_key = "045ab36b-e959-41c2-8b47-49caecc6d039"
post_key <- "&originCoordLat=59.329630&originCoordLong=18.059338&format=json"

querylist <- list(key = "045ab36b-e959-41c2-8b47-49caecc6d039",
                  originCoordLat = 59.293525,
                  originCoordLong = 18.083519)

library(httr)
a<-httr::GET(url = "https://api.resrobot.se/v2/location.nearbystops.json?",
             query = querylist)



