context("find missing value")
test_that ("remove_missing is to show a vector without NA", {
  a <- c(1, 4, 7, NA, 10)
  b <- c(2, 2, 6, 8, 10)
  c <- c(1, 3, 4, 5, NA, NA)
  d <- c(5, NA)
  expect_equal(remove_missing(a), c(1,4,7,10))
  expect_equal(remove_missing(b), c(2, 2, 6, 8, 10))
  expect_equal(remove_missing(c), c(1, 3, 4, 5))
  expect_equal(remove_missing(d), c(5))
})

context("find minimum")
test_that ("get_minimum is minimum output in a numeric vector", {
  a <- c(1, 4, 7, NA, 10)
  b <- c(2, 2, 6, 8, 10)
  c <- c(1, 3, 4, 5, NA, NA)
  d <- c(5, NA)
  expect_equal(get_minimum(a, na.rm = TRUE), 1)
  expect_equal(get_minimum(b, na.rm = TRUE), 2)
  expect_equal(get_minimum(c, na.rm = TRUE), 1)
  expect_equal(get_minimum(d, na.rm = TRUE), 5)
  
})

context("find maximum")
test_that ("get_maximum is maximum output in a numeric vector",{
  a <- c(1, 4, 7, NA, 10)
  b <- c(1, 2, 3, 8, 5)
  expect_equal(get_maximum(a, na.rm = TRUE), 10)
  expect_equal(get_maximum(a, na.rm = FALSE), 10)
  expect_equal(get_maximum(b, na.rm = TRUE), 8)
  expect_equal(get_maximum(b, na.rm = FALSE), 8)
})

context ("get a range between max and min")
test_that ("get_range is to compute overall range",{
  a <- c(1, 4, 7, NA, 10)
  b <- c(1, 2, 3, 8, 5) 
  expect_equal(get_range(a, na.rm = TRUE), 9)
  expect_equal(get_range(a, na.rm = FALSE), 9)
  expect_equal(get_range(b, na.rm = TRUE), 7)
  expect_equal(get_range(b, na.rm = FALSE), 7)
})

context("compute the 10th percentile of the input vector")
test_that("get_percentile10 is to compute the 10th percentile of input vector",{
  a <- c(1, 4, 7, NA, 10)
  b <- c(1, 2, 3, 8, 5)
  expect_equal(get_percentile10(a, na.rm = TRUE), 1.9)
  expect_equal(get_percentile10(a, na.rm = FALSE), 1.9)
  expect_equal(get_percentile10(b, na.rm = TRUE), 1.4)
  expect_equal(get_percentile10(b, na.rm = FALSE), 1.4)
})

context("compute the 90th percentile of input vector")
test_that("get_percentile90 is to compute the 90th percentile of input vector",{
  a <- c(1, 4, 7, NA, 10)
  b <- c(1, 2, 3, 8, 5)
  expect_equal(get_percentile90(a, na.rm = TRUE), 9.1)
  expect_equal(get_percentile90(a, na.rm = FALSE), 9.1)
  expect_equal(get_percentile90(b, na.rm = TRUE), 6.8)
  expect_equal(get_percentile90(b, na.rm = FALSE), 6.8)
})

context("get median of input vector")
test_that("get_median is to compute the median of the input vector",{
  a <- c(1, 4, 7, NA, 10)
  b <- c(1, 2, 3, 8, 5)
  expect_equal(get_median(a, na.rm = TRUE), 5.5)
  expect_equal(get_median(a, na.rm = FALSE), 5.5)
  expect_equal(get_median(b, na.rm = TRUE), 3)
  expect_equal(get_median(b, na.rm = FALSE), 3)
})

context("get average of input vector")
test_that("get_average is to compute the mean of input vector",{
  a <- c(1, 4, 7, NA, 10)
  b <- c(1, 2, 3, 8, 5)
  expect_equal(get_average(a, na.rm = TRUE), 5.5)
  expect_equal(get_average(a, na.rm = FALSE), NA_real_)
  expect_equal(get_average(b, na.rm = TRUE), 3.8)
  expect_equal(get_average(b, na.rm = FALSE), 3.8)
})

context("get the standard deviation of input vector")
test_that("get_stdev is to compute std of input vector",{
  a <- c(1, 4, 7, NA, 10)
  b <- c(1, 2, 3, 8, 5)
  expect_equal(round(get_stdev(a, na.rm = TRUE),2), 3.87)
  expect_equal(round(get_stdev(a, na.rm = FALSE),2), NA_real_)
  expect_equal(round(get_stdev(b, na.rm = TRUE),2), 2.77)
  expect_equal(round(get_stdev(b, na.rm = FALSE),2), 2.77)
})

context("get the first quartile of the input vector")
test_that("get_quartile1 is to compute the first quartile of input vector",{
  a <- c(1, 4, 7, NA, 10)
  b <- c(1, 2, 3, 8, 5)
  expect_equal(get_quartile1(a, na.rm = TRUE), 3.25)
  expect_equal(get_quartile1(a, na.rm = FALSE), 3.25)
  expect_equal(get_quartile1(b, na.rm = TRUE), 2)
  expect_equal(get_quartile1(b, na.rm = FALSE), 2)
})

context("get the third quartile of the input vector")
test_that("get_quartile3 is compute the third quartile of input vector",{
  a <- c(1, 4, 7, NA, 10)
  b <- c(1, 2, 3, 8, 5)
  expect_equal(get_quartile3(a, na.rm = TRUE), 7.75)
  expect_equal(get_quartile3(a, na.rm = FALSE), 7.75)
  expect_equal(get_quartile3(b, na.rm = TRUE), 5)
  expect_equal(get_quartile3(b, na.rm = FALSE), 5)
})

context("calculate the number of missing values NA")
test_that("count_missing is to compute the number of NA",{
  a <- c(1, 4, 7, NA, 10)
  b <- c(1, 2, 3, 8, 5)
  c <- c(NA, NA, 1)
  d <- c(NA, NA, 3, 2)
  expect_equal(count_missing(a), 1)
  expect_equal(count_missing(b), 0)
  expect_equal(count_missing(c), 2)
  expect_equal(count_missing(d), 2)
})

context("return list of summary statistics")
test_that("summary_stats returns list of summary statistics",{
  a <- c(1, 4, 7, NA, 10)
  b <- c(1, 2, 3, 8, 5)
  expect_equal(round(summary_stats(a)[[10]],2), 3.87)
  expect_equal(summary_stats(a)[[1]], 1)
  expect_equal(round(summary_stats(b)[[10]],2), 2.77)
  expect_equal(summary_stats(b)[[1]],1)
  
})

context("compute a rescaled vector with 100")
test_that ("rescale100 shows a rescaled vector with 100",{
  a <- c(18, 15, 16, 4, 17, 9)
  b<- c(7, 2, 15, 5, 19, 20)
  expect_equal(rescale100(a, xmin=0, xmax=20)[1], 90)
  expect_equal(rescale100(a, xmin=0, xmax=20)[2], 75)
  expect_equal(rescale100(b, xmin=0, xmax=20)[1], 35)
  expect_equal(rescale100(b, xmin=0, xmax=20)[2], 10)
})

context("return vector by dropping the lowest value")
test_that("drop_lowest returns a vector by dropping the lowest value",{
  a <- c(10, 10, 8.5, 4, 7, 9)
  b <- c(3, 3, 5, 10, 9)
  expect_equal(drop_lowest(a)[1], 10)
  expect_equal(length(drop_lowest(a)), 5)
  expect_equal(drop_lowest(b)[1], 3)
  expect_equal(length(drop_lowest(b)), 4)
})

context("compute average of homework score ")
test_that("score_homework is to compute mean of homework score",{
  hws <- c(100, 80, 30, 70, 75, 85)
  hws1 <- c(34, 21, 100, 67, 11)
  expect_equal(score_homework(hws, drop = TRUE), 82)
  expect_equal(round(score_homework(hws, drop = FALSE),2), 73.33)
  expect_equal(score_homework(hws1, drop = TRUE), 55.5)
  expect_equal(score_homework(hws1, drop = FALSE), 46.6)
  
  
})

context("compute quiz score")
test_that("score_quiz is to compute quiz score",{
  quizzes <- c(100, 80, 70, 0)
  quizzes1 <- c(40, 90, 88)
  expect_equal(round(score_quiz(quizzes, drop = TRUE),2), 83.33)
  expect_equal(score_quiz(quizzes, drop = FALSE), 62.5)
  expect_equal(score_quiz(quizzes1, drop = TRUE), 89)
  expect_equal(round(score_quiz(quizzes1, drop = FALSE),2), 72.67)
  
})

context("compute the corresponding lab score")
test_that("score_lab is to compute lab score",{
  expect_equal(score_lab(12),100)
  expect_equal(score_lab(10),80)
  expect_equal(score_lab(6),0)
  expect_equal(score_lab(8),40)
})





