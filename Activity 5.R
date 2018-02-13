#### Class activity 5

## 2/8/18



make_values <- function(name){
  UseMethod("student", name)
}


make_values.student <- function(name){
  courage = sample(1:100,1)
  ambition = sample(1:100,1)
  intellegence = sample(1:100,1)
  effort = sample(1:100,1)
  a = c(courage, ambition, intellegence, effort)
  class(a) = "student"
  return(a)
}

Jonah <- make_values.student()

Jonah

class(Jonah)

##### Part 2


?sort

sort.student <-function(name, matrix){
  sorted <- t(matrix) %*% make_values.student(name)
  if(max(sorted) == sorted[1]){
    return("GRYFFINDOR")
  }
  if(max(sorted) == sorted[2]){
    return("SLYTHERIN")
  }
  if(max(sorted) == sorted[3]){
    return("RAVENCLAW")
  }
  if(max(sorted) == sorted[4]){
    return("HUFFLEPUFF")
  }
}

sort.student(Jonah, diag(4))


### Part 3

class(Jonah) <- c(class(Jonah), sort.student(Jonah, diag(4)))
class(Jonah)

###### part 4
 "Gryffindor_Tower" <- new.env()
"Black_Lake" <- new.env()
"Ravenclaw_Tower" <- new.env()
"Basement" <- new.env()


curfew <- function(x){
  UseMethod("curfew",x)
}

curfew.GRYFFINDOR <- function(x){
Gryffindor_Tower$student <- x
}

curfew.SYLTHERIN  <- function(x){
  Black_Lake$student <- x
}

curfew.RAVENCLAW  <- function(x){
  Ravenclaw_Tower$student <- x
}

curfew.HUFFLEPUFF  <- function(x){
  Basement$student <- x
}

curfew(Jonah)
class(Jonah)
ls.str(Ravenclaw_Tower)
