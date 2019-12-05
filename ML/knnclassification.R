## KNN Classification

?mtcars
attach(mtcars)

library(lattice)

#this is the model to classify the # of cyllinders according to weight and height
with(mtcars, xyplot(wt ~ mpg, group=cyl, auto.key=T, pch=20, cex=3))


library(class)

train <- cbind(mpg, wt)

test <- c(26,2.2)
knn(train, test, cl=cyl, k=2, prob=T)

