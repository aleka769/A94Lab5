
test_that(desc = "Non-numeric input for longitude/latitude", {
  code = expect_error(nearby_stops( 16.178,  "58.591", api_key = api_key))
  code = expect_error(nearby_stops("16.178",  58.591,  api_key = api_key))
  code = expect_error(nearby_stops("16.178", "58.591", api_key = api_key))
})

test_that(desc = "Non-numeric input for radius", {
  code = expect_error(nearby_stops(16.178, 58.591, api_key = api_key, radius = "hello!"))
  code = expect_error(nearby_stops(16.178, 58.591, api_key = api_key, radius = factor(0)))
  code = expect_error(nearby_stops(16.178, 58.591, api_key = api_key, radius = "Try again!"))
})

test_that(desc = "Expecting error, unable to search bus stops in remote countries", {
  expect_error(nearby_stops(-119.417931, 36.778259, api_key = api_key))   # USA (California)
  expect_error(nearby_stops(-0.076132, 51.508530, api_key = api_key))     # UK  (London)
})

test_that(desc = "Non-valid API key", {
  expect_error(nearby_stops(16.178, 58.591, api_key = "api_key"))
  expect_error(nearby_stops(16.178, 58.591, api_key = "Non_working_key"))
  expect_error(nearby_stops(16.178, 58.591, api_key = 12345))
})

test_that(desc = "Warnings for nearby_stops() work fine", {
  expect_warning(nearby_stops(16.178, 58.591, api_key = api_key, radius = 10000))
  expect_warning(nearby_stops(16.178, 58.591, api_key = api_key, radius = 0))
  
  expect_warning(nearby_stops(16.178, 58.591, api_key = api_key, max_locations = 10000))
  expect_warning(nearby_stops(16.178, 58.591, api_key = api_key, max_locations = 0))
})

test_that(desc = "Expecting output of correct format", {
  test_frame <- nearby_stops(16.178, 58.591, api_key = api_key, max_locations = 0)
  
  code = expect_equal(nrow(test_frame), 1)              # min 1 location in search
  code = expect_equal(ncol(test_frame), 8)
  code = expect_equal(is.data.frame(test_frame), TRUE)
})