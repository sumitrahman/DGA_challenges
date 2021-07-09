# coding challenge week ending 9 July
# Find the prime factors of the input number

list_factors <- function(n) {
  if (n %in% 2:3) {
    list_of_proper_factors <- numeric(0)
  } else {
    nn <- as.integer(sqrt(n))
    candidates <- 2:nn
    are_they_factors <- n %% candidates == 0

    list_of_proper_factors <- candidates[are_they_factors]
    list_of_proper_factors <-
      c(list_of_proper_factors, n / list_of_proper_factors)
    list_of_proper_factors <- unique(list_of_proper_factors)
  }

  return(list_of_proper_factors)
}

list_prime_factors <- function(n) {
  if (!is.numeric(n) |
    length(n) != 1 | !identical(n, round(n)) | !sign(n) == 1) {
    stop("Your input must be a single, positive integer")
  } else if (n == 1) {
    result <- "1 has no prime factors"
  } else {
    first_list <- list_factors(n)
    second_list <- first_list[vapply(
      X = first_list, FUN.VALUE = TRUE,
      FUN = function(x) {
        length(list_factors(x)) == 0
      }
    )]

    if (length(second_list) == 0) {
      result <- paste0(n, " is a prime number")
    } else {
      if (length(second_list) == 1) {
        result <-
          paste0(c(n, "has just one prime factor:", second_list),
            collapse = " "
          )
      } else {
        second_list <- second_list[order(second_list)]
        result <-
          paste0(c("The prime factors are:", second_list), collapse = " ")
      }
    }
  }
  return(result)
}

unique_prime_factorisation <- function(n){
  if (!is.numeric(n) |
      length(n) != 1 | !identical(n, round(n)) | !sign(n) == 1) {
    stop("Your input must be a single, positive integer")
  } else if (n == 1) {
    upf <- "1 has no prime factors; the UPF is 1"
  } else {
    upf <- c()
    divisor <- 2
    dividend <- n
    while(dividend >= divisor){
      if(dividend %% divisor == 0){
        upf <- c(upf, divisor)
        dividend <- dividend / divisor
      }else{
        divisor <- divisor + 1
      }
    }
  }
    
    return(upf)
}

list_prime_factors2 <- function(n){
  upf <- unique_prime_factorisation(n)
  result <-
    paste0(c("The prime factors are:", unique(upf)), collapse = " ")
  
  return(result)
}
