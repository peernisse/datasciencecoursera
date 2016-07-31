myFunction <- function() {
  x <- rnorm(100)
  mean(x)
  }

myFunction()

second <- function(x) {
  x+rnorm(length(x))
}

