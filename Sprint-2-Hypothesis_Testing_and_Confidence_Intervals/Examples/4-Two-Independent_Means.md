# Hypothesis Testing for Two Independent Sample Means

## Introduction

Now that we’ve learned to test hypotheses and calculate confidence intervals for a single population parameter, we wish to extend our inference methods to be able to compare two groups. In this chapter we will focus on comparing means using two different study designs: two independent samples and matched pairs. 

## Two Independent Sample Design

In a two independent sample design, random samples are selected from two distinct populations. The mean of each sample is computed, and, using a two-sample t-test, we test if the population means are equal (the null hypothesis) or if one population mean is greater than the other or if they are simply not equal (the possible alternative hypotheses). If the population means are determined not to be equal to each other, we can create a confidence interval to estimate the true difference in the population means.

Assumptions for a two independent sample t-test are similar to those for a one-sample t-test except that they apply to both samples. The first assumption is that each sample is randomly selected from an independent, larger population. The second assumption is that each sample size is large enough (about 40) or that the variable of interest has a Normal distribution in each independent population.

## Matched-Pairs Study Design

In a matched pairs design, the individuals in the two samples are selected to be dependent on each other. One classic matched pairs design is a twin study, where one twin experiences one set of experimental conditions and the other twin experiences a different set of experimental conditions. Rather than comparing the overall means for each experimental condition, the interesting result is the difference within each set of twins. The null hypothesis in a matched pairs study is that the mean difference is equal to zero and the alternative hypothesis is that the mean difference is greater than, less than or not equal to zero. Dependent sample studies can also be matched in other ways: for example, a parent and child, two partners in a relationship or the same individual under two sets of experimental conditions.

The assumptions for a matched pairs study design are similar to the assumptions for a t-test for a single population mean but focus on the differences calculated for each study pair. The first assumption is that the data is a simple random sample from the larger population. This can be tricky to think about because, while the two samples are dependent on each other, each pair should be chosen to be independent. 

The second assumption is that the observations are randomly selected from a population with a Normal distribution or that the sample size is large enough. In a matched pairs design, the sample size is actually the number of pairs of observations. If there are not at least 40 pairs of observations, a histogram of the differences and/or a Normal QQ plot should indicate a roughly Normal distribution.


## Guided Project:  Determine the most effective mosquito repellant treatment for soldiers in the Indian Army.

Mosquito nets have traditionally been an important tool to prevent mosquito bites in parts of the world where malaria is endemic. However, it may not be practical for an army that is on the move to set up and carry mosquito nets each night and day. Impregnating soldiers’ uniforms with insect repellant solves the mobility problem but also has drawbacks. First, the insect repellant quickly becomes ineffective with repeated washing and ironing and must be frequently reapplied. Second, in hot and humid climates the insect repellant can be absorbed through the skin, and the long-term effects of this exposure are unknown. One compromise is to have soldiers apply patches treated with insect repellant to their clothing. These patches would last longer because they would not be washed or ironed and would not expose the entire body to the insect repellant.

The `Mosquito.xlsx` dataset contains data recorded in an experiment conducted on male soldiers in the Indian Army who were stationed in the Tezpur/Solmara garrison in Northeast India. Thirty soldiers were randomly selected to receive one of five types of mosquito repellant patch. Three of the treatments were a single repellant and two were combinations of two repellants. After giving informed consent, the study participants affixed the patches at predetermined points on their uniforms and research assistants (who were blinded to the type of repellant used) counted the number of times a mosquito landed on each individual in an hour2. We wish to determine if there is a difference in the mean number of mosquito landings between soldiers who wore patches with a single repellant and soldiers who wore patches with a combination of two repellants.

Project deliverables:

1.	Import the `Mosquito.xlsx` dataset into R-Studio. Open the data dictionary and identify each variable in the dataset as categorical or quantitative. If the variable is categorical, further identify it as ordinal, nominal or an identifier variable. If the variable is quantitative, identify it as discrete or continuous.

2.	Determine the experimental design in this scenario. Is this a matched pairs design or a test for two independent means?

3.	Identify the null and alternative hypotheses.

4.	Identify the appropriate statistical test for these hypotheses. Verify that the assumptions for using that test are met.

5.	Conduct your hypothesis test and report your conclusion at the alpha = 0.05 significance level.

6.	Create and interpret a 95% confidence interval for the difference in the mean number of mosquito touches between soldiers who wore patches treated with only one kind of mosquito repellant and soldiers who wore patches treated with a combination of two kinds of mosquito repellant.

7.	Draw conclusions about the effectiveness of patches with one versus a combination of two types of mosquito repellant.

### Deliverable 1: Import the `Mosquito.xlsx` dataset into R-Studio. Open the data dictionary and identify each variable in the dataset as categorical or quantitative. If the variable is categorical, further identify it as ordinal, nominal or an identifier variable. If the variable is quantitative, identify it as discrete or continuous.

The first variable is ID, which is a categorical, identifier variable that identifies each unique study participant. The second variable is Treatment, which is a nominal, categorical variable indicating which mosquito repellant patch treatment the participant received (one repellant or  a combination of two repellants). The third variable is Mosq_count, which is a discrete, quantitative variable that gives the number of times the participant was touched by a mosquito in an hour while wearing the repellant patches. 

### Deliverable 2: Determine the experimental design in this scenario. Is this a matched-pairs design or are we comparing two independent means?

Because we wish to compare two independent groups – soldiers wearing patches with one mosquito repellant and soldiers wearing patches with a combination of two mosquito repellants – we are comparing two independent means. In contrast, if the same soldiers were assigned to wear one-repellant patches and then two-repellant patches, that would be a matched-pairs study design.

### Deliverable 3: Identify the null and alternative hypotheses.

Let the mean number of mosquito touches on soldiers wearing one-repellant patches be µ1 and the mean number of mosquito touches on soldiers wearing two-repellant patches be µ2. In a study design comparing two independent means, the null hypothesis is that the means of the two populations are equal. 

- H0: µ1 - µ2= 0

In this scenario, the alternative hypothesis is that the mean number of mosquito touches will be different depending on the different type of patches being worn.

- Ha: µ1 - µ2 ≠ 0

Note that you also could specify µ1 to be the mean number of mosquito touches for soldiers wearing two-repellant patches and µ2 to be the mean number of mosquito touches for soldiers wearing the one-repellant patches.

### Deliverable 4: Identify the appropriate statistical test for these hypotheses. Verify that the assumptions for using that test are met.

Because we are comparing the means of two independent groups, we will conduct a two-sample t-test.

The first assumption is that the observations in each group are all independent of each other. In the scenario, we learned that soldiers enrolled in the study were randomly assigned to the two treatments (wearing one-repellant or two-repellant patches). Therefore, this assumption is met. 

The second assumption is that the number of mosquito touches in each population has a Normal distribution or that the size of each sample is at least 40. We can check the sample size part of the assumption by making a table of the treatment variable.

```
> table(Mosquito$Treatment)
 0  1 
90 60
```

Histograms and QQ plots for the number of mosquito touches in each treatment group show that the distribution of mosquito touches is unimodal but slightly skewed to the right (probably due, in part, to the fact that the number of mosquito touches can’t be negative). However, because there are at least 40 observations in each treatment group, the Central Limit Theorem tells us that the distribution of the mean number of mosquito touches in each treatment group will be Normal. 

### Deliverable 5: Conduct your hypothesis test and report your conclusion at the alpha = 0.05 significance level.

Because calculating the pooled standard deviation for a two-sample t-test is a bit complicated, it makes more sense to use the `t.test` function rather than trying to find the t-statistic by hand and calculate the p-value using the `pt` function.

```
> t.test(
    Mosquito$Mosq_count[Mosquito$Treatment == 0],
    Mosquito$Mosq_count[Mosquito$Treatment == 1]
)

	Welch Two Sample t-test

data:  Mosquito$Mosq_count[Mosquito$Treatment == 0] and Mosquito$Mosq_count[Mosquito$Treatment == 1]
t = 3.9539, df = 132.44, p-value = 0.0001246
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
 1.038327 3.117228
sample estimates:
mean of x mean of y 
 8.011111  5.933333 
```
Note that the data we need to compare the two means is not stored as two separate variables but is instead identified by Treatment. The brackets after `Mosquito$Mosq_count` can be read as “where”. So the first entry in the t.test function is the variable "`Mosq_count` where `Treatment == 0`" and the second entry is "the variable `Mosq_count` where `Treatment == 1`”. In other words, we are comparing the number of mosquito touches for soldiers who were wearing one repellant patches to the number of mosquito touches for soldiers wearing two repellant patches. The default difference in the two population means is 0 and the default alternative hypothesis is “two-sided”.

We can see from the results that the t-statistic is 3.95 and the p-value is 0.00012.  We reject the null hypothesis at the alpha = 0.05 level and conclude that the mean number of mosquito touches for soldiers wearing one-repellant patches is different than the mean number of mosquito touches for solders wearing two-repellant patches.

### Deliverable 6: Create and interpret a 95% confidence interval for the difference in the mean number of mosquito touches between soldiers who wore patches treated with only one kind of mosquito repellant and soldiers who wore patches treated with a combination of two kinds of mosquito repellant.

The 95% confidence interval for the difference in the mean number of mosquito touches is found in the t-test results in the previous deliverable.  

```
95 percent confidence interval:
 1.038327 3.117228
 ```

We are 95% confident that soldiers wearing one-repellant patches will have, on average, 1 to 3 more mosquito touches than solders wearing two-repellant patches.

### Deliverable 7: Draw conclusions about the effectiveness of patches with one versus a combination of two types of mosquito repellant.

Results of our hypothesis test and confidence interval indicate that soldiers wearing two-repellant patches have, on average, between one and three fewer mosquito touches in an hour. Because fewer mosquito touches (hopefully!) leads to fewer disease-carrying mosquito bites, the two-repellant patches seem to be more effective.
