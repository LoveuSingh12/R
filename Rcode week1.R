# Vector
myFirstVector <- c(10, 20, 30, 40, 50)
# converting one data type to another type
x <- 3.14
class(x)
y <- as.integer(x)
class(y)
a <- TRUE
class(a)
b <- as.integer(a)
b
# Name a vector
x <- c(1,2,3,4)
names(x) <- c("a", "b" , "c", "d")

# Matrices
myFirstMatrix <- matrix(c(1:12), nrow = 4, ncol = 3, byrow = TRUE)
myFirstMatrix
class(myFirstMatrix)
mat1 <- c(1:4)
mat2 <- c(5:8)
x <- cbind(mat1, mat2)
class(x)
m <- matrix(c(1:12), nrow = 4, ncol = 3, byrow = TRUE)
colnames(m) <- c("m", "n", "o")
rownames(m) <- c("p", "q", "r", "s")
m

#Data Frame
eid <- c(100,101,102,103)
name <- c("Laurel", "Hardy", "Charlie", "Chaplin")
age <- c(25, 22, 28, 29)
married <- c(TRUE, TRUE, FALSE, TRUE)
myFirstDataframe <- data.frame(eid, name, age, married)
df <- data.frame(eid, name, age, married)
# Last 2 rows
df[c(3:4),]

#List
myFirstList <- list(myFirstVector, myFirstDataframe, myFirstMatrix, list("a", 1, 34, TRUE))
myFirstList[[1]][2]



#Slicing
vec <- c(10, 20, 30, 40, 50, 60, 70)
vec
names(vec) <- c("a", "b", "c", "d", "e", "f", "g")
# empty square bracket
vec[]
# First element
vec[1]
vec["a"]
# Seventh element
vec[7]
vec["g"]
# All elements except 5th element
vec[-5]

#factors
x <- c("S", "M", "M", "L", "S", "S", "M")
x <- factor(x, levels = c("S", "M", "L"), labels = c("Small", "Medium", "Large"),
            ordered = TRUE)
x

# User-defined function
square <- function(x,y) {x**y}
square(1:6,2)
square <- function(x, y){
  return (x**2)
}
square(1:10,2)