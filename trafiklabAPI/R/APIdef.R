library(httr)
library(jsonlite)
api_url <- "https://api.resrobot.se/v2/location.nearbystops.json?"
api_key <- "045ab36b-e959-41c2-8b47-49caecc6d039"
liu_nkpg <- list(key = api_key,
                 originCoordLat = 59.591,
                 originCoordLong = 16.178)

liu_nkpg_result <- jsonlite::fromJSON(httr::modify_url(url = api_url, 
                                                       query = liu_nkpg))

liu_lkpg <- list(key = api_key,
                 originCoordLat = 58.399,
                 originCoordLong = 15.583)

liu_lkpg_result <- jsonlite::fromJSON(httr::modify_url(url = api_url, 
                                                       query = liu_lkpg))

liu_us <- list(key = api_key,
               originCoordLat = 58.400,
               originCoordLong = 15.620)

liu_us_result <- jsonlite::fromJSON(httr::modify_url(url = api_url, 
                                                     query = liu_us))


 
