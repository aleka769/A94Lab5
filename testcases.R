api_key <- Sys.getenv("trafiklab_key")

liu_nkpg <- nearby_stops(16.178, 58.591)
liu_lkpg <- nearby_stops(15.583, 58.399)
liu_us   <- nearby_stops(15.620, 58.400)

platser <- c( "nobeltorget", "skarphagens c", "linköping centr", "falla")
names(platser) <- platser

hallplatser <- lapply(X = platser, FUN = location_lookup, api_key=api_key)

