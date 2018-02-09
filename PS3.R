### S3 method
x <- 1
class(x) <- "door"

PlayGame <- function(x){
  UseMethod("PlayGame", x)
}

PlayGame.door <- function(x){
  car <- sample(1:3, 1)
  print (car)
  if (x == car) return("You Win a Car!!!")
  else return("You get a goat :(")
}
PlayGame(x)


### S4 method

