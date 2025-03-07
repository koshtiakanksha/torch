library(testthat)
library(torch)

test_that("Spam dataset loads correctly", {
  dataset <- spam_dataset()
  
  # Check dataset length
  expect_true(dataset$.length() > 0)
  
  # Check sample output
  sample <- dataset$.getitem(1)
  expect_true(inherits(sample$x, "torch_tensor"))
  expect_true(inherits(sample$y, "torch_tensor"))
  
  # Check input shape
  expect_equal(dim(sample$x), c(57))  # 57 features
})
