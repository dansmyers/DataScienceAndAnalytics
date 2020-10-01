# Sampling Techniques

## Introduction

Over the course of the next several chapters, we will learn strategies for making statistical inference - in other words, for drawing conclusions about a population from a sample. The first assumption when performing statistical inference is that your sample(s) are representative of the population(s) of interest. However, selecting truly representative samples is possibly the most difficult (and important!) factor in a statistical analysis. If a statistic calculated from a sample is not an accurate estimate of the population parameter, the study is of little (or no!) value.

When working with humans in particular, there are many practical considerations involved in identifying a population of interest and ensuring that your selected study participants actually participate. While these are very important – and you can read more about them in your main statistics textbook -  this chapter will focus on the computational aspect of sample selection.

Using R or other software (or a good, old fashioned random number table) is essential when doing sample selection because the one thing that unites all good samples is that they are selected using randomization and not human choice. We will learn to implement three sampling methods: simple random sampling, stratified sampling and cluster sampling, and discuss the benefits of each. Large surveys like the ones that occur before national elections often use very complex sampling schemes (multi-layer combinations of cluster and stratified sampling) to try to ensure that the samples they select are unbiased.  

## Sampling methods

The simplest sampling method is the simple random sample (SRS). In an SRS, each individual in the population has an equal chance of being selected and each sample of the same size has an equal chance of being selected. The SRS is considered the “gold standard” of sampling methods and works very well for lab rats and machine parts but can have some drawbacks when applied to more complex populations.

For example, simple random sampling can – by chance – fail to select any observations from small but important subgroups in the population. Let’s say you believe that older age (90+ years) is an important feature of your population. An SRS – again, just by chance – may not randomly select anyone older than age 90 because that age group makes up a small fraction of the overall population. Stratified sampling is an alternative sampling method that can address this potential problem. In stratified sampling, important population strata (such as age group) are defined, and an SRS is selected from each stratum, thus ensuring that members of each strata are represented in the final sample.

Another potential problem with the SRS is that a population can be clustered in a way that makes it impractical to randomly sample members of each cluster. For example, if you wanted to compare two methods for teaching reading to first graders, it wouldn’t be practical to have a first grade class where a couple students were learning to read using one method, a few were learning to read using the other method and the rest were not part of the study at all. Instead, it would make more sense to randomize entire first grade classes to either of the two methods or leave them out of the study completely. In cluster sampling, important population clusters are identified and entire clusters are randomly selected to be part of the sample. 

## Guided Project 1: Compare different sampling methods for estimating the mean finishing time at the Disney Marathon in 2020.

More than 14,000 people finished the 2020 Disney Marathon held on January 12. The results by age and gender group are included in the Disney.xlsx dataset1. We wish to select a simple random sample and a stratified sample of race participants and compare the mean finishing time in those samples to the mean finishing time for all race participants. 

Project deliverables:

1.	Import the `Disney.xlsx` dataset into R-Studio. Use the data dictionary to identify each variable in the dataset as categorical or quantitative. If the variable is categorical, further identify it as ordinal, nominal or an identifier variable. If the variable is quantitative, identify it as discrete or continuous. 

2.	Calculate the mean finishing time for all 2020 Disney Marathon race participants.

3.	Determine the relative frequency of marathon finishers in each age-gender group. 

4.	Create a side-by-side box plot of finishing time by age-gender group.

5.	Select a simple random sample of 75 marathon participants and calculate the mean finishing time. 

6.	Determine the relative frequency of marathon finishers in each age-gender group in the sample. Compare the age-gender distribution in the sample to the age-gender distribution in the entire population of finishers.

7.	Select a stratified random sample that includes 0.5% of each age-sex group, and calculate the mean finishing time in this sample.

8.	Compare the mean finishing time for the two samples to the mean finishing time for the entire population of finishers.

### Deliverable 1: Import the `Disney.xlsx` dataset into R-Studio. Use the data dictionary to identify each variable in the dataset as categorical or quantitative. If the variable is categorical, further identify it as ordinal, nominal or an identifier variable. If the variable is quantitative, identify it as discrete or continuous. 

The first variable is ID, which is a categorical identifier variable used to identify each runner in the 2020 Disney Marathon. The second variable is gender, which is a nominal, categorical variable that identifies the participant’s gender. The third variable is age, which is a continuous, quantitative variable that identifies the participant’s age in years. The fourth variable is group, which is an ordinal, categorical variable that places each individual in an age-gender group. The fifth variable is time, which is a quantitative, continuous variable that lists the participant’s finishing time in hours.

### Deliverable 2: Calculate the mean finishing time for all 2020 Disney Marathon race participants.  

Run the following mean function to calculate the mean finishing time.

```
> mean(Disney$time)
[1] 6.062126
```

The mean finishing time for all participants was 6.06 hours.

### Deliverable 3: Determine the relative frequency of marathon finishers in each age-gender group. 

Run the following prop.table function to calculate the percent of individuals in each age-gender group. 

```
> prop.table(table(Disney$group)) * 100

F18-24        F25-29         F30-34        F35-39        F40-44        F45-49        F50-54        F55-59 
3.7998015 8.2588969 8.6558911 9.7405359 8.0249539 6.5433149 4.0904580 2.5946406 
F60-64         F65+            M18-24       M25-29      M30-34        M35-39      M40-44       M45-49 
1.1626258 0.5033319 2.1834680 4.4165603 6.8977740 7.8406352 7.8689919 6.0612505 
M50-54        M55-59       M60-64      M65+ 
5.1183893 3.0058131 2.0487736 1.1838934
```

Men and women between the ages of 25 and 45 made up the largest proportion of participants. There were many fewer participants who were younger than 25 or older than 60.

### Deliverable 4: Create a side-by-side box plot of finishing time by age-gender group.

In previous analyses, we used boxplots to display and describe the distribution of a single continuous variable. However, it can also be useful to print multiple boxplots side-by-side so you can compare their distributions.

Type and run the following boxplot function in an R Script. The argument `Disney$time ~ Disney$group` instructs R to create a boxplot of finishing time for every age-sex group. The `las = 2` statement causes the boxplot labels to be rotated 90 degrees, and `xlab = ' '` will cause the x-axis to remain blank (printed x-axis text gets in the way of the rotated boxplot labels in this figure). 

```
boxplot(
    Disney$time ~ Disney$group,
    main = 'Disney Marathon 2020 Finishing Times 
            by Age and Gender Group',
    ylab = 'Finishing Time in Hours',
    xlab = ' ',
    las = 2
)
```

The median finishing time is longer and there are fewer fast outliers in the older age-sex groups. 

### Deliverable 5: Select a simple random sample of 75 marathon participants and calculate the mean finishing time. 

When working with functions that make random selections from a population, it can be helpful to use the set.seed function. The set.seed function sets the seed of R’s random number generator so the results of the random selection will be the same if it is performed multiple times or  by multiple individuals. It doesn’t matter what number you set the seed to, as long as the seed numbers match, you will get the same results from the random process. 

```
set.seed(1234)
```

The following sample function (below inside the brackets) instructs R to select a random subset of 75 rows from the Disney dataset. Type and run the following line of code to select the SRS of 75 participants.

```
Disney.SRS<-Disney[sample(nrow(Disney), 75), ]
```

We can now use the mean function to calculate the mean finishing time in the SRS.

```
> mean(Disney.SRS$time)
[1] 5.668652
```

The mean finishing time for the SRS of 75 participants was 5.67 hours.

### Deliverable 6: Determine the relative frequency of marathon finishers in each age-gender group in the sample. Compare the age-gender distribution in the sample to the age-gender distribution in the entire population of finishers.

Running the following prop.table function will calculate the percent of individuals in the sample in each age-gender group.

```
> prop.table(table(Disney.SRS$group))*100

  F18-24   F25-29   F30-34   F35-39   F40-44   F45-49   F50-54 
9.333333 6.666667 9.333333 6.666667 5.333333 6.666667 6.666667 
  F55-59   F60-64     F65+   M18-24   M25-29   M30-34   M35-39 
2.666667 1.333333 1.333333 4.000000 2.666667 8.000000 8.000000 
  M40-44   M45-49   M50-54   M55-59 
5.333333 8.000000 4.000000 4.000000
```

We see that the SRS – just by chance – did not select any male participants who were 60 years or older.

### Deliverable 7: Select a stratified random sample that includes 0.5% of each age-sex group, and calculate the mean finishing time in this sample.

The stratified function is not included automatically when you download R and RStudio, so you will have to install and load it using the install.packages and library functions below. Type and run the following two statements in your R Script.

```
install.packages("splitstackshape")

library("splitstackshape")
```

We also need to set the seed again so our results are reproducible.

```
set.seed(1234)
```

Type and run the following statements in your R Script to select the stratified random sample.

```
Disney.stratified <- stratified(
    Disney, 
    group = "group", 
    size = .005
)
```

The first entry in the `stratified` function is the dataset that we want to sample from. The `group =` argument indicates the name of the variable to stratify on. The `size =` argument is the size of each sample to be selected. If `size =` a number between 0 and 1, a random sample of that proportion will be selected from each stratum. If `size =` a positive integer, R will select a random sample of that size from each stratum. Because `size = 0.005`, the function will randomly select 0.05% of each stratum to be included in the sample. We chose this proportion so the stratified sample and the SRS would be similar in size. 

Calculate the mean finishing time for the stratified sample.

```
> mean(Disney.stratified$time)
[1] 6.09234
```

The mean finishing time for individuals in the stratified random sample was 6.09 hours.

### Deliverable 8: Compare the mean finishing time for the two samples to the mean finishing time for the entire population of finishers.

To review, the mean finishing time in the population and in the two samples was:

```
> mean(Disney$time)
[1] 6.062126

> mean(Disney.SRS$time)
[1] 5.668652

> mean(Disney.stratified$time)
[1] 6.09234
```

Both samples give an estimate of the mean finishing time that are similar to the population mean. The mean finishing time estimated using the sample random sample is about 6.5% below the population mean and the mean time estimated using the stratified random sample is about 0.5% above the population mean. In this example, the estimate using the stratified sample is closer to the true population mean finishing time than the estimate using the SRS. 

Keep in mind, though, that is these are the results of a single set of random samples. If we generated two new random samples starting with a different seed, it is possible that the SRS – by chance – would be a better estimate of the population mean than the stratified sample.

## Guided Project 2: Compare different sampling methods for estimating the mean height of a National Hockey League (NHL) player in 2013 - 2014.

Sports fans often love to know all about their favorite players including their heights, weights and ages, and professional leagues frequently collect and publish this information. A roster of players from the 2013-2014 NHL season is included in the `NHL.xlsx` dataset. Because players are clustered in different locations by the team they play for, we wish to determine if a cluster sample (using team as the clustering variable) produces a good estimate of the mean height of all NHL players for the 2013-2014 season.

Project deliverables:

1.	Import the `NHL.xlsx` dataset into R-Studio. Use the data dictionary to identify each variable in the dataset as categorical or quantitative. If the variable is categorical, further identify it as ordinal, nominal or an identifier variable. If the variable is quantitative, identify it as discrete or continuous. 

2.	Calculate the mean height of all NHL players in 2013 - 2014.

3.	Determine the mean height of each team. 

4.	Select a simple random sample of 75 NHL players and calculate the mean height.

5.	Select a cluster sample with three randomly selected NHL teams and calculate the mean height.

6.	Compare the mean height for the two samples to the mean height of the entire population of NHL players during the 2013-2014 season.

### Deliverable 1: Import the NHL.xlsx dataset into R-Studio. Use the data dictionary to identify each variable in the dataset as categorical or quantitative. If the variable is categorical, further identify it as ordinal, nominal or an identifier variable. If the variable is quantitative, identify it as discrete or continuous. 

The first variable is Team, which is a nominal, categorical variable. The second variable is Player, which is a categorical, identifier variable identifying each unique player. The third variable is Position, which is a nominal, categorical variable indicating each player’s position. The fourth, fifth and sixth variables are Age, Weight and Height, which are all quantitative, continuous variables.

### Deliverable 2: Calculate the mean height of all NHL players in 2013 - 2014.

Run the following mean function to calculate the mean height of all NHL players during the 2013-2014 season.

```
> mean(NHL$Height)
[1] 73.26081
```

The mean height of all NHL players in the 2013-2014 season was 73.26 inches.

### Deliverable 3: Determine the mean height of each team. 


The aggregate function splits data into subsets (typically based on the values of a categorical variable), computes summary statistics for each subset, and returns the results in a table. In this case, we wish to split the data into teams (our subsets), calculate the mean height of each team, and return the results.

Type and run the aggregate in your R Script to produce the following results.

```
> aggregate(
    NHL$Height ~ NHL$Team,
    FUN = mean
)
                NHL$Team NHL$Height
1          Anaheim Ducks   73.79167
2        Arizona Coyotes   73.45833
3          Boston Bruins   73.43478
4         Buffalo Sabres   72.72000
5         Calgary Flames   73.37037
6    Carolina Hurricanes   73.78261
7     Chicago Blackhawks   73.87500
8     Colorado Avalanche   72.96154
9  Columbus Blue Jackets   72.75000
10          Dallas Stars   73.53846
11     Detroit Red Wings   73.18519
12       Edmonton Oilers   73.26087
13      Florida Panthers   72.69565
14     Los Angeles Kings   73.70833
15        Minnesota Wild   73.81481
16    Montreal Canadiens   73.17391
17   Nashville Predators   73.04167
18     New Jersey Devils   72.96429
19      New York Rangers   73.84000
20       Ottawa Senators   73.24000
21   Philadelphia Flyers   72.44000
22   Pittsburgh Penguins   73.03846
23       San Jose Sharks   73.40000
24       St. Louis Blues   73.08333
25   Tampa Bay Lightning   73.08000
26   Toronto Maple Leafs   74.26087
27     Vancouver Canucks   73.22727
28   Washington Capitals   72.47826
29         Winnipeg Jets   73.08000
```

The mean height of each team is quite similar - right around 73 inches.

### Deliverable 4: Select a simple random sample of 75 NHL players and calculate the mean height.

Using the example in Deliverable 5 in Guided Project 1, we can select a random sample of 75 players from the NHL dataset using the following commands.

```
set.seed(1234)

NHL.SRS<-NHL[sample(nrow(NHL), 75), ]
```

The resulting mean height is

```
> mean(NHL.SRS$Height)
[1] 73.16
```

The mean height for the SRS of 75 NHL players was 73.16 inches.

### Deliverable 5: Select a cluster sample from the NHL dataset that includes three randomly selected teams. Calculate the mean height of the players in the cluster sample.

The cluster function is also not included automatically when you download R and R Studio, so you will have to install and load it using the install.packages and library functions below.

```
install.packages("sampling")

library("sampling")
```

Set the seed for the random number generator to ensure your results can be reproduced.

```
set.seed(1234)
```

Type and run the following code in your R script to select the teams that will be included in the cluster sample. Note that it will take one more step to actually assemble the cluster sample dataset.

```
cl <- cluster(
    NHL, 
    clustername = c("Team"), 
    size = 3, 
    method = c("srswor")
)
```

The first entry in the cluster function is the dataset we want to sample from. The `clustername = c("Team")`, argument indicates that we want to use Team as the clustering variable. The `size = 3` argument specifies that we want to select 3 teams. Finally, the `method =`  argument indicates the method used to select the sample of clusters. We wish to use the “srswor” method, which means simple random sample without replacement. 

Unlike the `stratified` function, the `cluster` function does not return all the variable values along with the rows of data selected for the sample. We have to take one more step and use the getdata function, which will return all of the rows of NHL that appear in `cl` (the players on the three teams selected by the cluster function).

```
NHL.cluster<-getdata(NHL,cl)
```

Finally, we can calculate the mean height of the players in the cluster sample.
 
```
> mean(NHL.cluster$Height)
[1] 73.30435
```

The mean height of NHL players in the cluster sample is 73.3 inches.

### Deliverable 6: Compare the mean height for the two samples to the mean height in for the entire population of NHL players during the 2013-2014 season. 

To review, the mean height in the population and in the two samples was:

```
> mean(NHL$Height)
[1] 73.26081

> mean(NHL.SRS$Height)
[1] 73.16

> mean(NHL.cluster$Height)
[1] 73.30435
```

Both samples give an estimate of the mean player height that are very similar to the population mean. The mean height estimated using the SRS is about 0.1% below the population mean and the mean height estimated using the cluster sample is about 0.06% above the population mean. Because players are naturally clustered in locations by teams, using a cluster sample to estimate mean player height might be preferable – from an efficiency standpoint – to using an SRS.
