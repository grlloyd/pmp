context("test-check_peakmatrix_orientation")

test_that("Output data matrix is in correct orientation", {
  out <- check_peak_matrix(peak_data=t(testData$data), classes=testData$class)
  expect_equal(out, testData$data)
})

test_that("Output data matrix is in correct orientation and data frame type is returned", {
  peak_data <- as.data.frame(t(testData$data))
  out <- check_peak_matrix(peak_data=peak_data, classes=testData$class)
  expect_true(is.data.frame(out))
})

test_that("Output data matrix is in correct orientation if no transpose is needed", {
  out <- check_peak_matrix(peak_data=testData$data, classes=testData$class)
  expect_equal(out, testData$data)
})

test_that("Function fails", {
  expect_error(check_peak_matrix(peak_data=testData$data, classes=testData$class[1:3]))
})

test_that("Function fails", {
  expect_error(check_peak_matrix(peak_data=testData$data[,1:6], classes=testData$class))
})

test_that("Function works if class labels are not provided", {
  out <- check_peak_matrix(peak_data=testData$data)
  expect_equal (out, testData$data)
})

test_that("Function works if class labels are not provided and matrix needs to be transposed", {
  expect_warning (out <- check_peak_matrix(peak_data=t(testData$data)))
  expect_equal(out, testData$data)
})

test_that("Function works if class labels are not provided and matrix needs to be transposed,
          and data type is retained", {
  peak_data <- data.frame(t(testData$data))
  expect_warning (out <- check_peak_matrix(peak_data=peak_data))
  expect_true(is.data.frame(out))
})

test_that("Function returns warning if input peak matrix has the same number of samples and features", {
  expect_warning (out <- check_peak_matrix(peak_data=testData$data[1:9, ], 
    classes=testData$class))
})
