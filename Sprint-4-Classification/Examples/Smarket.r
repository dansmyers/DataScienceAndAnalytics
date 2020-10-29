#--- Analyze Stock Market data
#
# This examples uses the Smarket data set from Introduction to Statistical
# Learning: with Applications in R (ISLR) by James et al.

# The Smarket data set records information about S&P 500 market returns for
# 1250 trading days from 2001 to 2005. Each record records the percentage
# change observed for each of the previous five days of trading (called the
# "lag") and the trading volume.
#
# The goal is to predict "Direction" a binary variable that records whether
# the market went up or down on each day.

library(ISLR)

#--- Summary statistics
summary(Smarket)

#--- Correlation
#
# Use [, -9] to calculate the correlation matrix for all columns except
# Direction, which is categorical
cor(Smarket[, -9])

#--- Plot Volume to examine its change over time
plot(Smarket$Volume)


#--- Train the logistic regression model to predict Direction based on 
# lags and volume
glm.fits = glm(Direction ~ Lag1 + Lag2 + Lag3 + Lag4 + Lag5 + Volume ,
             data=Smarket ,family=binomial)

#--- Summary shows that Lag1 is the only variable close to being significant
# and it's p-value is about .15 - not very good
summary(glm.fits)

#--- Get the coefficients from the model
coef(glm.fits)

#--- Predict probability of moving up on the training data
glm.probs=predict (glm.fits, type="response")

glm.pred=rep("Down" ,1250)
glm.pred[glm.probs >.5] = "Up"

table(glm.pred, Smarket$Direction )

#--- Percentage of correct classifications
mean(glm.pred == Smarket$Direction)


#--- Repeat but now use a training set from years 2001 to 2004 and testing
# set consisting of year 2005
train = (Smarket$Year < 2005)
Smarket.2005 = Smarket[!train, ]

dim(Smarket.2005)

Direction.2005 = Smarket$Direction[!train]

# Fit the model using only the training subset
glm.fits = glm(Direction ~ Lag1 + Lag2 + Lag3 + Lag4 + Lag5 + Volume, data=Smarket ,family=binomial ,subset=train)

# Predict probabilities of moving up for the Smarket.2005 testing subset
glm.probs = predict (glm.fits, Smarket.2005, type = "response")

# Calculate performance on the test set
glm.pred = rep("Down", 252)
glm.pred[glm.probs >.5] = "Up"
table(glm.pred, Direction.2005)
mean(glm.pred == Direction.2005)


#--- Using K-nearest neighbors classifier
library(class)

train.X = cbind(Smarket$Lag1, Smarket$Lag2)[train, ]
test.X = cbind(Smarket$Lag1, Smarket$Lag2)[!train, ]
train.Direction = Smarket$Direction[train]

set.seed(1)

knn.pred=knn(train.X, test.X, train.Direction, k=1)

table(knn.pred ,Direction.2005)

# Experiment with increasing k
#
# k = 3 gives slightly greater than 50% correct classification, but higher
# values provide no further improvement