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