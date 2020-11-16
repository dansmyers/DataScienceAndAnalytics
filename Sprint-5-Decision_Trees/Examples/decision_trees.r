#--- Building decision trees with rpart

library(rpart)
library(rpart.plot)


#--- First example: classify iris flowers

# Use the rpart function to create a decision tree
#
# Use method="class" to build a classification tree
Iris.tree <- rpart(Species ~ ., data=iris, method="class")


# Plot the tree
#
# type=5 labels each branch with its decision rule
rpart.plot(Iris.tree, type=5)


#--- Second example: Titanic data set

# Load from Excel file
library(readxl)
Titanic <- read_excel("Downloads/Titanic.xlsx")
View(Titanic) 

# Change Survived to a text string variable for ease of interpretation
Titanic$Survived.char <- ifelse(
  test = (Titanic$Survived == 0),
  yes = "Died",
  no = "Survived"
)


# Question: how to control size of tree?
#
# Ideally, we want a small, compact tree that still provides
# good classification performance and doesn't overfit
#
# There are two strategies:
#
# 1. Control the depth of the tree during construction
#    Stop expanding a node once it's "good enough"
#
# 2. Build a large tree and then prune away branches that
#    yield only small increases in performance

# rpart uses a special "complexity parameter" to control tree
# depth during growing or pruning
#
# The complexity parameter (cp) is calculated for each node and
# takes into account both the accuracy of the classifier and the
# size of the tree -- the actual calculation is kind of abstract
#
# Generally, a node with small cp corresponds to a leaf node that doesn't
# add a lot of classification value --> good candidate for pruning

# rpart can take a cp parameter to control the depth of the tree
# during construction
#
# Larger values of cp --> more aggressively pruning branches
# that don't generate significant improvements in
# classification accuracy
#
# The default value of cp is .01
#
# cp=0 tells rpart to build the largest possible tree, which
# is likely to be overfit, but can be pruned later
Titanic.tree <- rpart(Survived.char ~ Sex + Age + Pclass,
                      data=Titanic,
                      method="class", cp=0)


# Plot the tree
#
# type=5 labels each branch with its decision rule
rpart.plot(Titanic.tree, type=5)


# plotcp generates a plot showing how the relative error changes
# as a function of the number of nodes in the tree
#
# It can be used to find a decent value for cp to trade off
# between the accuracy of the classifer and tree complexity
plotcp(Titanic.tree)


# Prune off the more complex sub-branches
#
# cp is a threshold
# higher values --> more aggressive pruning
Titanic.pruned <- prune(Titanic.tree, cp=.092)


# Plot again
rpart.plot(Titanic.pruned, type=5)
