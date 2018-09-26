library(httr)
querylist <- list(key = "045ab36b-e959-41c2-8b47-49caecc6d039",
                  originCoordLat = 59.293525,
                  originCoordLong = 18.083519)
a<-httr::GET(url = "https://api.resrobot.se/v2/location.nearbystops.json?",
             query = querylist)
b<- jsonlite::fromJSON(txt= "https://api.resrobot.se/v2/location.nearbystops.json?key=045ab36b-e959-41c2-8b47-49caecc6d039&originCoordLat=58.397&originCoordLong=15.576")
b$StopLocation
 
