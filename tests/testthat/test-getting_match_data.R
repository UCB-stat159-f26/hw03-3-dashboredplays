# test_that("description of what should happen", {
#   expect_equal(what_the_actual_function_gives, what_it_should_give)
# })

female_js <- readLines(test_path("FemalePlayerCareer.js"), warn = FALSE)
male_js <- readLines(test_path("MalePlayerCareer.js"), warn = FALSE)

test_that("parse_career_js has 17 columns, one row per match", {
  expect_equal(dim(parse_career_js(female_js)), c(3, 17))
  expect_equal(dim(parse_career_js(male_js)), c(3, 17))
})

test_that("in_dob_format tells female and male files apart", {
  expect_true(in_dob_format(parse_career_js(female_js)[, 17]))
  expect_false(in_dob_format(parse_career_js(male_js)[, 17]))
})

test_that("opponent_age converts DOBs to ages for female files", {
  mat <- parse_career_js(female_js)
  ages <- opponent_age(as.Date(mat[, 1], "%Y%m%d"), mat[, 17])
  expect_equal(round(ages[1], 2), 18.78)
})

test_that("opponent_age keeps the given ages for male files", {
  mat <- parse_career_js(male_js)
  ages <- opponent_age(as.Date(mat[, 1], "%Y%m%d"), mat[, 17])
  expect_equal(ages[1], 22.264202601)
})

test_that("clean_matches builds the plotting data frame", {
  df <- clean_matches(parse_career_js(female_js), "19810926", "Serena Williams")
  expect_equal(names(df), c("player", "result", "player_age", "age_diff"))
  expect_equal(round(df$age_diff[1], 2), -4.68)
})