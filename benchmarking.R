source("prime_factors.R")

library(microbenchmark)
library(tidyverse)

list_prime_factors(37 * 37 * 37 * 37 * 97 * 32)
list_prime_factors(123456789)
list_prime_factors(562345)
list_prime_factors(776)

mbm <- microbenchmark(
  test_4b <- list_prime_factors2(37 * 37 * 37 * 37 * 97 * 32),
  test_3b <- list_prime_factors2(776),
  test_2b <- list_prime_factors2(562345),
  test_1b <- list_prime_factors2(123456789),
  test_4a <- list_prime_factors(37 * 37 * 37 * 37 * 97 * 32),
  test_3a <- list_prime_factors(776),
  test_2a <- list_prime_factors(562345),
  test_1a <- list_prime_factors(123456789)
)

mbm
autoplot(mbm)
