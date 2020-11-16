#--- Neural network example on the iris data set

# Import the library
# Install using install.packages("neuralnet")
library(neuralnet)

# Train the neural network model
#
# The formula at the beginning of the call does not like it if you use
# . to specify all variables: you stil need to type them out explicitly
#
# hidden=3 specifies a single hidden layer with three nodes
#
# Use the logistic activation function
#
# linear.ouptut=FALSE is required to use the nonlinear activation function
nn <- neuralnet(Species ~ Petal.Length + Petal.Width + Sepal.Length + Sepal.Width, 
                iris, 
                hidden = 3, 
                act.fct = "logistic",
                linear.output = FALSE)

# Predict classifications for the iris flowers
#
# Output shows that each flower is assigned its correct class
predict(nn, iris)

# Visualize the network
#
# This is of limited utility for understanding what the model is doing,
# but is still pretty cool
plot(nn)
