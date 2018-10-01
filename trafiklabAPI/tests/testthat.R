library(testthat)
library(trafiklabAPI)

<<<<<<< HEAD
test_that(desc = "Non-numeric input for longitude/latitude", {
  code = expect_error(nearby_stops( 16.178,  "58.591", api_key = api_key))
  code = expect_error(nearby_stops("16.178",  58.591,  api_key = api_key))
  code = expect_error(nearby_stops("16.178", "58.591", api_key = api_key))
})
=======
>>>>>>> 5a5de848ff34ecd68649eb16fbadc34f31b61307

test_check("trafiklabAPI")
