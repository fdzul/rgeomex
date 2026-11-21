test_that("state keys are normalised", {
  expect_equal(rgeomex:::.state_code(c(31, "9", "09", " 1")), c("31", "09", "09", "01"))
  expect_error(rgeomex:::.state_code("33"))
  expect_error(rgeomex:::.state_code("Yucatan"))
})

test_that("the registry has every file of every dataset", {
  reg <- rgeomex:::.registry()
  expect_true(all(grepl("^[0-9a-f]{64}$", reg)))
  whole <- paste0(rgeomex:::.whole, ".parquet")
  by_state <- as.vector(outer(rgeomex:::.by_state, sprintf("_%02d.parquet", 1:32), paste0))
  expect_setequal(names(reg), c(whole, by_state))
})

test_that("the dataset table and the errors are right", {
  d <- rgeomex_datasets()
  expect_equal(nrow(d), 12)
  expect_error(rgeomex_load("blocks_ine20_mx"), "split by state")
  expect_error(rgeomex_load("unknown"), "unknown dataset")
})

test_that("the most similar string is found", {
  expect_equal(find_most_similar_string("merida", c("Merida", "Mexicali")), "Merida")
})

test_that("a locality and its blocks are downloaded and extracted", {
  skip_on_cran()
  skip_if_offline("github.com")
  withr::local_envvar(RGEOMEX_DATA_DIR = file.path(tempdir(), "rgeomex"))
  x <- extract_blocks(cve_edo = "31", locality = "Merida")
  expect_s3_class(x$block, "sf")
  expect_equal(nrow(x$locality), 1)
  expect_gt(nrow(x$block), 15000)
  expect_equal(sf::st_crs(x$block)$epsg, 4326L)
})
