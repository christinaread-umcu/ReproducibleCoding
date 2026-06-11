library(testthat)

testthat::test_that("bmi calculation", {
  testthat::expect_equal(calculate_bmi(70, 1.75), 22.85714, tolerance = 1e-5)
  testthat::expect_equal(calculate_bmi(50, 1.60), 19.53125, tolerance = 1e-5)
  testthat::expect_equal(calculate_bmi(90, 1.80), 27.77778, tolerance = 1e-5)
})

testthat::test_that("binary conversion", {
  df <- data.frame(family_history_with_overweight = c("yes", "no"))
  out <- convert_binary_columns(df, "family_history_with_overweight")
  testthat::expect_equal(out$family_history_with_overweight, c(1, 0))
})

testthat::test_that("ordinal conversion", {
  df <- data.frame(CAEC = c("no", "Sometimes", "Frequently", "Always"))
  out <- convert_ordinal_columns(df, "CAEC")
  testthat::expect_equal(out$CAEC, c(0, 1, 2, 3))
})