# While loop
x <- 1
while(x <= 7) {
  print(x)
  x <- x + 1
}

# For loop
cities <- c("London", "Paris", "Vienna", "Zurich", "Copenhagen",
            "Oslo", "Stockholm")
for (city in cities) {
  print(nchar(city))
}

# break and next
for (city in cities) {
  if(nchar(city)==10){
    next
  }
  print(city)
}
#Import Data in R#
getwd()
#    a <- read.table("abc.txt")   #Example
#    b <- read.csv("abc.csv")     #Example
#    c <- read.delim("abc.txt")   #Example
# for excel file
install.packages("xlsx")
library(xlsx)
#    d <- read.xlsx("abc.xlsx", 1)

# Histogram
hist(faithful$eruptions, right = FALSE, col = colors)
colors = c("red", "blue", "green", "yellow", "orange", "cyan", "pink", "violet")
# Boxplot
boxplot(mpg ~ cyl, data = mtcars, main = "Car Mileage data",
        xlab = "No. of cyclinders", ylab = "Miles per gallon")

install.packages("ggplot2")
library(ggplot2)
head(MovieRatings)
str(MovieRatings)
colnames(MovieRatings) <- c("Film", "Genre", "CriticRating", "AudienceRating", "BudgetMillions",
                            "Year")
str(MovieRatings)
MovieRatings$Year <- factor(MovieRatings$Year)
# Aesthetic & Geometries
ggplot(data = MovieRatings, aes(x = CriticRating, y = AudienceRating,
                                col = Genre, size = BudgetMillions)) +
  geom_point()
# Override Aesthetic
ggplot(data = MovieRatings, aes(x = CriticRating, y = AudienceRating,
                                col = Genre, size = BudgetMillions)) +
  geom_point(aes(size = CriticRating))

# Scatterplots
w <- ggplot(data = MovieRatings, aes(x = CriticRating, y =
                                       AudienceRating, col = Genre))
w + geom_point() + facet_grid(.~Year)
w + geom_point(size = 3) + geom_smooth() + facet_grid(Genre~Year)
w + geom_point() + geom_smooth() + facet_grid(Genre~Year)
w + geom_point(aes(size = BudgetMillions)) + geom_smooth() + 
  facet_grid(Genre~Year)

# lapply
####Vector####
lapply(c(1, 3, 5, 7, 9), function (x){x*x} )

# sapply
city <- c("London", "Berlin", "Zurich", "Vienna")
lapply(city, nchar)
sapply(city, nchar, USE.NAMES = FALSE)

# tapply
tapply(iris$Sepal.Length, iris$Species, sd)
tapply(mtcars$hp, list(mtcars$cyl, mtcars$am), mean)