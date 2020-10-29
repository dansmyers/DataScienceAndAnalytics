# Analyze weather data set from rattle.data using logistic regression 

library(rattle.data)
View(weather)

#--- Step 1: carve off some fields that aren't useful
#
# Use subset to remove columns that we don't need
#
# Here, the select field creates a vector of column names, then uses the minus
# sign to keep all columns EXCEPT the one we specify

weather.features <- subset(weather, select = -c(Date, Location, WindGustDir,
                                                       WindDir9am, WindDir3pm, RISK_MM))


#--- Step 2: replace the Yes/No features with numeric values
#
# Using numerics allows us to compute correlations between variables
weather.features$RainToday.num <- ifelse(
  test = (weather.features$RainToday == "Yes"),
  yes = 1,
  no = 0
)

weather.features$RainTomorrow.num <- ifelse(
  test = (weather.features$RainTomorrow == "Yes"),
  yes = 1,
  no = 0
)

# Drop the Yes/No columns
weather.features <- subset(weather.features, select=-c(RainToday, RainTomorrow))


#--- Step 3: Look at the correlation matrix
#
# Matrix shows the relationships between each pair of variables
#
# Higher correlation values (in either direction) indicate that changes in
# one variable are associated with changes in another
#
# 

cor(weather.features)


#--- Step 4: Fit a logistic regression model to predict if it will rain tomorrow
# based on all features
#
# glm is "General Linear Model"
# family = "binomial" corresponds to logistic regression
#
# RainTomorrow.num ~ . tells the model to predict RainTomorrow.num using all
# of the available features

weather.glm <- glm(RainTomorrow.num ~ ., family="binomial", data=weather.features)

#--- Step 5: view the output of the model
#
# The p-values for the coefficients show which features are significant predictors
# Pressure3pm is the most important predcitor
summary(weather.glm)

#--- Step 6: Determine the fraction of correct classifications

# Use the predict function to predict probabilities for each point in the 
# dataset
weather.probs <- predict(weather.glm, type="response")

# Map the probabilities to a Yes/No value
# The first line creates a vector of 366 "No" values and the second converts
# entries with prob. > .50 to "Yes"
weather.pred <- rep(0, 366)
weather.pred[weather.probs > .50] = 1

# Plot a table of outcomes
#
# The table shows that our model predicts all values of RainTomorrow as "No"
table(weather.pred, weather.features$RainTomorrow.num)
mean(weather.pred == weather.features$RainTomorrow.num)
