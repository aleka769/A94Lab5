api_key <- "045ab36b-e959-41c2-8b47-49caecc6d039"

liu_nkpg <- nearby_stops(16.178, 58.591, api_key = api_key)
liu_lkpg <- nearby_stops(15.583, 58.399, api_key = api_key)
liu_us   <- nearby_stops(15.620, 58.400, api_key = api_key)

platser <- c( "nobeltorget", "skarphagens c", "linköping centr", "falla")
names(platser) <- platser

hallplatser <- lapply(X = platser, FUN = place_lookup, api_key=api_key)
