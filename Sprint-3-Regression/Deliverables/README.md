# Sprint 3 &ndash; Deliverables

## Animal Sleep

**What factors influence mammal sleep patterns?**

All mammals sleep. As any college student who has pulled an all-nighter knows, going without sleep or trying to function on too little sleep has a host of deleterious effects. But for something that is so clearly physiologically important, there is a great variety in sleep needs throughout the animal kingdom from animals that seem never to sleep to those who that seem never to wake (ahem, cats). Researchers recorded data on sleep duration as well as a set of ecological and constitutional variables for a selection of mammal species1. This data appears in the `Sleep.xlsx` dataset. We wish to examine the relationship between dreaming and non-dreaming sleep time in this set of mammal species. 

### Project deliverables
1.	Import the `Sleep.xlsx` dataset into R-Studio. Use the data dictionary to give a description of each variable in the data set.

2.	Display and describe the distribution of total sleep for the mammal species in the dataset.

3.	Plot the relationship between non-dreaming and dreaming sleep. Do animals who spend more time in dreaming sleep also spend more time in non-dreaming sleep or does dreaming sleep decrease as non-dreaming sleep increases?

4.	What is the appropriate method to model the relationship between time spent in non-dreaming sleep and time spent in dreaming sleep? Verify that the assumptions for using this method are met.

5.	Create a model to predict time spent in dreaming sleep from time spent in non-dreaming sleep.

6.	Calculate and interpret the correlation and R<sup>2</sup> describing the relationship between dreaming and non-dreaming sleep time.

7.	If a mammal species experiences 5 hours of non-dreaming sleep a day, how many hours of dreaming sleep would we expect that animal to get on average?

8.	Calculate the difference in the number of hours spent in non-dreaming and dreaming sleep for each mammal in the dataset.

9.	What is the appropriate test to determine if mammals spend the same or different numbers of hours in dreaming and non-dreaming sleep? Verify that the assumptions for using this test are met.

10.	Write the hypotheses for the test you identified in Deliverable 9.

11.	Conduct the hypothesis test and report your conclusion at the 0.05 significance level.

12.	Create a 95% confidence interval for the mean difference in the number of hours a mammal spends in non-dreaming and dreaming sleep.

13.	Summarize your findings about dreaming and non-dreaming sleep in mammals.


### Tips

In step 8, you can calculate the difference between dreaming and non-dreaming sleep using

```
Sleep$Sleepdiff <- Sleep$SWsleep - Sleep$Parasleep
```

In steps 9 - 11, this is technically a matched pairs t-test, because the two samples of sleep measurements are taken from the same animal. You can perform the required
t-test using

```
t.test(Sleep$Sleepdiff)
```




## Plants

**The goal of this problem is to present an example where linear regression is *not* the appropriate model**.

How do environmental factors contribute to the diversity of plant life on an island? The `Plants.xlsx` dataset provides information on a number of characteristics of the British Isles (not including Ireland or Britain itself) including latitude, area, and distance from Britain. We wish to use linear regression to determine if islands with a larger area are home to a greater number of species of plant life.

### Project deliverables:

1.	Import the `Plants.xlsx` dataset into R-Studio. Use the data dictionary to identify each variable in the dataset as categorical or quantitative.

2.	Create a scatterplot to display the relationship between island area and number of plant species living in the British Isles.

3.	Determine the regression equation that relates island area to number of plant species. 

4.	Modify the scatterplot from Deliverable 2 to include the regression line and correlation.

5.	Create a residual plot and look for potential violations of the assumptions for linear regression.

6.	Does island area seem to be related to the of number of plant species living on each of the British Isles? Is linear regression the correct method for modeling this relationship?  

## Linear Algebra

### Compute the following matrix-vector products

```
| 4 0 1 | | 3 |
| 0 1 0 | | 4 |
| 4 0 1 | | 5 |


| 1 0 0 | | 5  |
| 0 1 0 | | -2 |
| 0 0 1 | | 3  |


| 2 0 | | 1 |
| 1 3 | | 1 |
```

### Product size

If an *m* by *n* matrix *A* multiplies an *n*-dimensional vector *x*, what is the size and shape of the resulting *Ax*?

### Individual elements

Write down the 3 x 2 matrix *A* that has *a<sub>ij</sub>* = *i* + *j* and the 3 x 2 matrix *B* that has *b*<sub>*ij*</sub> = (-1)<sup>*i* + *j*</sup>

## References
1. Allison, T. and Cicchetti, D. (1976), "Sleep in Mammals: Ecological and Constitutional Correlates", Science, November 12, vol. 194, pp. 732-734.

2.	M.P. Johnson and D.S. Simberloff (1974). "Environmental Determinants
of Island Species Numbers in the British Isles," Journal of Biogeography, Vol. 1, pp. 149-154

3.	E.D. McCoy and E.F. Connor (1976). "Environmental Determinants of Island Species Number in the British Isles: A Reconsideration," Journal of Biogeography, Vol. 3, pp. 381-382.
