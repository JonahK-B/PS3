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

setClass(Class = "door",
         representation = representation(
           door = "numeric"
         ),
         prototype = prototype(
           door = c()
         )
)
new("door")

setValidity("door", function(x){
  test1 <- (x@door==1 | x@door==2 | x@door==3)
  if(!test1){return("@door is not a valid value")}
}
)
## will work
choice <- new("door", door = 1)
##will not work
choice <- new("door", door = 56)
choice
