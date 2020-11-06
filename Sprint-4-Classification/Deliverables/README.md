# Sprint 4 &ndash; Deliverables

## The Dream of Wearing Shorts Forever

<img src="https://upload.wikimedia.org/wikipedia/commons/3/30/City_Centre_viewed_from_Mount_Ainslie_lookout.jpg" width="75%" />

*View of Canberra*


Let's return to the `weather` data set, which recorded meteorological observations from a weather station in Canberra.

Suppose we're interested in whether it will rain today using the features corresponding to the weather measurements at 9 AM. Write an R script that builds a logistic
regression model for carrying out this task. Your model should do the following:

- Load the `weather` data set using `library(rattle.data)`.

- Use the `glm` function to predict `RainToday` based on the features that have `9am` in their names.

- Use `summary` to examine the output of the model and identify which features, if any, are significant.

- Predict the probability of rain today associated with each point in the data set, then create a table showing the numbers of correct and incorrect classifications.

- Compare your results to the naïve classification approach of just predicting "No" for every instance. Does your classifier perform better?


## Fisher's Irises

<img src="https://upload.wikimedia.org/wikipedia/commons/4/41/Iris_versicolor_3.jpg" width="50%" />

R.A. Fisher was a British statistician of the early 20th Century who made a huge number of contributions to the practice of statistics, including formulating the concept of
statistical significance and establishing the *p* < .05 guideline for hypothesis testing. In 1936, Fisher published a paper on a technique called linear disciminant analysis 
that used a set of measurements from iris flowers as its example. The iris data set has gone on to become probably the most famous example data set in machine learning.

The data set contains 150 examples divided equally between three species of iris flowers: *iris setosa*, *iris virginica*, and *iris versicolor*. The data record four
measurements for each flower: petal length, petal width, sepal length, and sepal width. The sepals are the outer part of the flower that protect and support it while it's
developing.

The iris data set is built into R and you can access it using

```
library(datasets)
data(iris)
```

- Load the data set and extract the four columns corresponding to the four feature measurements.

- Perform a *k*-means clustering with three clusters and visualize the results using `fviz_cluster`. 

- Create an elbow plot showing the within-cluster-sum-of-squares measurement for increasing values of *k* The plot shows that three is a reasonable choice for the number
of clusters, but there is a huge drop in WSS when moving from one to two clusters.

- Create a scatter plot using `petal.length` and `petal.width` as the two axes and the `species` as the color. Is it possible to separate one class from the other two
using only petal measurements?


## High vs. Low Mileage

<img src="https://hatchheaven.com/wp-content/uploads/2013/07/subary_gl_84_1-880x660.jpg" width="50%" />

*The 1984 Subaru hatchback. I learned to drive a stick shift on one of these. Ah, nostalgia.*

The ISLR package contains a data set called `Auto`, which can be used to predict whether cars have high or low gas mileage.

- Create a new variable called `high.mpg` that will have value 0 if a vehicle has below-median gas mileage and 1 if the vehicle has above-median gas mileage

```
Auto$high.mpg <- ifelse(
    test = (Auto$mpg < median(Auto$mpg)),
    yes = 0,
    no = 1
)
```

- Spend some time looking at the data (`View(Auto)`) and conducting some exploratory analysis. Which variables do you think are likely predictors of high vs. low gas
mileage? **Note that you can't use `Auto$mpg` as a predictor because we used it to define the class**.

- Split the model into a training set and a testing set. You want the test set to have 20-30% of the complete data set. Here's some code for picking a random test set using
`sample`:

```
train <- sample(c(TRUE, FALSE), nrow(Auto), replace=T, prob = c(.7, .3))
Auto.test <- Auto[!train, ]
```

- Construct a logistic regression model to predict the probability that a vehicle is high or low mileage. Make sure to train on only the training set. 

- Use `summary` to investigate which predictors appear to be significant.

- Calculate the confusion matrix and the overall fraction of correct classifications for your test set. How does your model perform?
