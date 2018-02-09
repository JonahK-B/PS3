### S3 method
## Chose which door to pick
x <- 1
## Assigned it to class "door"
class(x) <- "door"
##generic function
PlayGame <- function(x){
  UseMethod("PlayGame", x)
}
##door method
PlayGame.door <- function(x){
  car <- sample(1:3, 1)
  ##print which door the car was behind
  print (car)
  if (x == car) return("You Win a Car!!!")
  else return("You get a goat :(")
}
## run game, print the door the car was behind followed by win or lose method
PlayGame(x)


### S4 method

##Set door class
setClass(Class = "door",
         representation = representation(
           door = "numeric"
         ),
         prototype = prototype(
           door = c()
         )
)

##Set restrictions that door must be 1, 2, or 3
setValidity("door", function(x){
  test1 <- (x@door==1 | x@door==2 | x@door==3)
  if(!test1){return("@door is not a valid value")}
}
)
## Still unsure what initialize does
setMethod("initialize", "door", function(.Object, ...) {
  value = callNextMethod()
  validObject(value)
  return(value)
}
)
## will work
choice <- new("door", door = 1)
##will not work
choice <- new("door", door = 56)
## Hey it worked
choice

## Make a generic function
setGeneric("PlayGame", 
           function(object) { 
             standardGeneric("PlayGame") 
           } ) 

## Make a door method which generates where the car will be and plays the game
setMethod("PlayGame", "door", 
          function(object){ 
            a <- sample(1:3, 1)
            ## Print which door the car was behind
            print(a)
            if(object@door == a){
            return("You Win a car!") 
            }
            else return("You get a goat")
          } )

## run game, print the door the car was behind followed by win or lose method
PlayGame(choice)

