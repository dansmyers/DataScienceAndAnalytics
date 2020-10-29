# K-means clustering on wine data

library(rattle.data)
library(factoextra)

#--- Load the data and extract a few features to use for explanatory analysis
data(wine, package="rattle.data")
wine_subset <- scale(wine[ , c(2:4)])

#--- Apply k-means to generate three clusters
#
# iter.max is the maximum number of k-means iterations to apply
#
# nstart = 25 tells the method to try 25 different clusterings from random
# initializations and keep the best one
wine_cluster <- kmeans(wine_subset, centers = 3,
                       iter.max = 10,
                       nstart = 25)

#--- Visualize the cluster outputs projected into 2-D space using principal
# components analysis
fviz_cluster(wine_cluster, data = wine_subset)

#--- How many clusters should we choose? Make an elbow plot showing the value
# of the within-cluster-sum-of-squares for increasing values of k
#
# The best cluster choice is one near the "elbow" in the graph

k.max <- 10

# The following statement iterates over values of k from 1 to k.max
# For each value of k, it applies the clustering function and then records
# the within-cluster-sum-of-squares
wss <- sapply(1:k.max, function(k) {
  kmeans(wine_subset,k,nstart = 20, iter.max = 20)$tot.withinss
})

# Make the plot
plot(1:k.max, wss, type= "b", xlab = "Number of clusters (k)", ylab = "Within cluster sum of squares")
