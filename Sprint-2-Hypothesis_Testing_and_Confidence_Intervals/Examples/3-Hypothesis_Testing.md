# Hypothesis Testing and Confidence Intervals

## Introduction

Up to this point, we’ve focused our analyses on describing the data we have on hand. We determined the casualty rate for 45 companies from Ohio during the US Civil War, modeled the relationship between the amount of nitrogen remaining in a skeleton buried in a Northern England cemetery to how long it had been interred, and calculated the survival rate for adults and children on the Titanic.

However, we are now ready to make the leap from describing data for a small set of individuals to doing statistical inference. We do this in two primary ways: by conducting hypothesis tests and creating confidence intervals.   

## Hypothesis Tests

A statistical hypothesis test allows us to weigh evidence for or against an existing claim. When we do statistical inference about a mean, our null hypothesis is that the population mean is equal to a particular value. This value may have been determined from another study or may just be conventional wisdom or other educated guess. We then pose an alternative hypothesis – that the mean is greater than, less than, or simply not equal to – the value proposed in the null hypothesis. 

Many students find setting up statistical hypotheses and drawing conclusions about those hypotheses based on a p-value to be counterintuitive at first. This would be a good point to stop and review the chapter(s) in your main statistics book if you still have lingering questions about the mechanics of hypothesis testing. 

## Confidence Intervals

A confidence interval allows us to make an educated guess with a pre-determined level of confidence (often 95%) about the true value of the population mean. The confidence interval formula uses the sample mean, sample standard deviation, and sample size – along with a parameter that allows us to control how confident we want to be – to propose a range of possible values for the population mean. We believe with a certain level of confidence that the population mean is somewhere in that range.

There is a certain amount of controversy in the statistical world over whether it is “better” to make statistical decisions based on the results of hypothesis testing or confidence intervals. A common criticism of hypothesis testing is that produces a “thumbs up” or “thumbs down” decision based on an arbitrary cut point (the significance level). Is there a practical difference between a p-value of 0.051 and a p-value of 0.049? Maybe not, and yet they would produce different conclusions at the 0.05 significance level. Confidence intervals, on the other hand, produce an estimate of the population mean, and leave it to the reader to determine if there is “enough” evidence to reject the null hypothesis. In the author’s opinion, there is value (both pedagogical and from a statistical decision making standpoint) in both types of statistical inference; therefore, both are illustrated in the following projects.

## Assumptions for Inference about a Population Mean

Hypothesis tests for a population mean are conducted using a one-sample t-test, and confidence intervals for a population mean make use of the t-distribution. The assumptions are the same for both. 

- First, the data should be a simple random sample from the larger population. This tends to be a very hard assumption to meet (see Chapter 7 for more discussion about representative sampling), so in practice, we wish to check that the observations are independent of each other (i.e. there are not multiple observations from the same individual), that they are randomly selected, and that they are as representative of the population as possible.

- Second, the observations come from a population that has a Normal distribution or that the sample size is large enough (greater than about 40). t-procedures still work very well for large non-Normal samples; however, the smaller the sample size, the more important it is that the data be roughly Normally distributed. 

## Guided Project: Is 98.60 F (37.00 C) Actually the Normal Human Body Temperature?

Everyone knows that 98.60 F (37.00 C) is the normal human body temperature.  But is that actually correct, and – come to think of it – how does everyone know that in the first place?

A German physician named Carl Reinhold August Wunderlich is generally credited with originating this idea, which was based on – reportedly – more than one million axiliary temperature readings taken from 25,000 subjects and was published in his 1868 book Das Verhalten der Eigenwärme in Krankheiten (which translates to The Behavior of the Self-Warmth in Diseases). But was he correct? History tells that his thermometer was a foot long and took 20 minutes to determine a subject’s temperature. For a measure that is used so often to determine general health, it would be a good idea to use modern instruments to confirm or refute his results.

In 1992, three physicians from the University of Maryland School of Medicine set out to do just that, measuring body temperatures for 223 healthy men and women aged 18-40 one to four times a day for 3 consecutive days using an electronic digital thermometer. The mean body temperature was computed for each individual, and this summary measure is recorded in the `Bodytemp.xlsx` dataset1. We wish to test the null hypothesis that the true mean healthy human body temperature is 98.60 F against the alternative hypothesis that the true mean healthy human body temperature is not 98.60 F.

Project deliverables:

1. Import the `Bodytemp.xlsx` dataset into R-Studio. Use the data dictionary to identify each variable in the dataset as categorical or quantitative. If the variable is categorical, further identify it as ordinal, nominal or an identifier variable. If the variable is quantitative, identify it as discrete or continuous. 

2. Identify the null and alternative hypotheses we wish to test.

3. Identify the appropriate statistical test for these hypotheses. Verify that the assumptions for using that test are met.

4. Determine the distribution of the sample mean under the null hypothesis.

5. Conduct the hypothesis test and report your conclusion at the alpha = 0.05 significance level.

6. Create and interpret a 95% confidence interval for the true mean healthy human body temperature.  

### Deliverable 1: Import the `Bodytemp.xlsx` dataset into R-Studio. Review the data dictionary to identify each variable in the dataset as categorical or quantitative. If the variable is categorical, further identify it as ordinal, nominal or an identifier variable. If the variable is quantitative, identify it as discrete or continuous. 

There are only two variables in the dataset. The first is ID, which is a categorical identifier variable used to identify each participant in the study. The second is Body_temp, which is a continuous, quantitative variable. 

### Deliverable 2: Identify the null and alternative hypotheses we wish to test.

The null hypothesis always a statement about the status quo or commonly accepted value of the mean. The alternative hypothesis is a statement of what we are trying to prove.  Therefore:

- H0: µ = 98.60 F
- Ha: µ ≠ 98.60 F

### Deliverable 3: Identify the appropriate statistical test for these hypotheses. Verify that the assumptions for using that test are met.

Because we are doing inference about a single population mean, as long as the assumptions are met, the appropriate statistical test is a t-test.  

The first assumption is that the data is a simple random sample from the larger population.  It is stated in the dataset description that the 223 adults in the sample were selected randomly; therefore, this condition is met.

The second assumption is that observations come from a population that has a Normal distribution or that the sample size is large enough (greater than about 40). The sample size is definitely large enough to meet this assumption, and we can also verify that the data appears to come from a population with a Normal distribution by making a histogram and/or a Normal QQ plot.

The `qqnorm` function will automatically generate a Normal QQ plot. If the points on the Normal QQ plot create a straight diagonal line from the lower left corner to upper right corner of the plot, it indicates the Normal model is a good fit for the data (see your course textbook for more details on the mechanics of the Normal QQ plot). Type and run the following statement to produce Figure 8.1

```
qqnorm(Bodytemp$Body_temp)
```

The commands for creating the histogram should be familiar at this point.

```
hist(
    Bodytemp$Body_temp, 
    main="Body Temperature", 
    xlab="Degrees F"
) 
```

Both the Normal QQ plot and the histogram show strong evidence that healthy human body temperature can be described using a Normal distribution. We can proceed feeling confident that a t-test is the correct procedure for testing our hypotheses.

### Deliverable 4: Determine the distribution of the sample mean under the null hypothesis.

Under the null hypothesis, the sample mean has a t-distribution with n-1 degrees of freedom. The mean is equal to the mean under the null hypothesis. We’ll assign this as m0.

```
m0 <- 98.6
```

The standard error is equal to *s / √n*, which we will need to calculate from the dataset. One quick way to find n, the sample size, is by recognizing that it is equal to the number of rows in the dataset, which we can find using the nrow function. 

```
n <- nrow(Bodytemp)

> n
[1] 223
```

Next, we need to calculate *s*, the standard deviation of Body_temp using the sd function.

```
stddev <- sd(Bodytemp$Body_temp)

> stddev
[1] 0.5237612
```

Finally, we calculate the standard error by dividing the standard deviation by the square root of the sample size.

```
se <- stddev/sqrt(n)

> se
[1] 0.03507364
```

Under the null hypothesis and subject to the assumptions we checked earlier, the sample mean has a t distribution with 222 degrees of freedom. The mean is 98.60 F and the standard error is 0.040 F.

### Deliverable 5: Conduct the hypothesis test and report your conclusion at the alpha = 0.05 significance level.

We can find the p-value for this hypothesis test in two ways. First, we can do it the “old fashioned way” by calculating a t-statistic based on our sample and using the pt function to determine the p-value. The formula to calculate the t-statistic is

```
t =  (x - μ_0)
    -----------
      (s⁄√n)  
```

We calculated the values of µ<sub>0</sub> (the mean under the null hypothesis), *s* and *√n* in Deliverable 4, so all that is left is to find the sample mean, *x_bar* and compute the t-statistic. 

```
xbar <- mean(Bodytemp$Body_temp)

> xbar
[1] 98.15919

t.stat<-(xbar-m0)/se

> t.stat
[1] -12.56805
```

Now that we have the t-statistic (one, we should note, that is very far from 0), we can calculate the p-value using the pt function.  The pt function takes two inputs, the t-statistic and the degrees of freedom and returns the probability of seeing a value equal to or smaller than the t-statistic for a t distribution with the same degrees of freedom. By default, pt returns the left-tail or “less than” probability (R calls this the lower tail). 

Because we have a two-sided (not equal to) alternative hypothesis, we need to calculate the probability of a t-statistic equal to or smaller than -12.57 and equal to or greater than 12.57. Fortunately, because of the symmetry of the t-distribution, this is as simple as multiplying the results of the pt function by 2.

```
> pt(
    t.stat, 
    df = 222
) * 2
[1] 1.025648e-27
```

The resulting p-value is a very small number expressed in scientific notation. The e-27 is an abbreviation for “x 10-27”. Therefore, our conclusion is to reject the null hypothesis at the 0.05 significance level and conclude that the mean healthy human body temperature is not 98.60 F.

We can also obtain the same results using R’s built-in t.test function. The t.test function takes the variable of interest as the first entry and the value of the mean under the null hypothesis as the second entry. The default alternative hypothesis is two-sized or “not equal to”. Note, however, that you can add a third entry to change the alternative to “greater than” or “less than” using alternative = c("greater than”) or alternative = c(“less than”), respectively. In your R Script, type and run the t.test function to produce the following results.

```
> t.test(
    Bodytemp$Body_temp,
    mu = 98.6
)

One Sample t-test

data:  Bodytemp$Body_temp
t = -12.568, df = 222, p-value < 2.2e-16
alternative hypothesis: true mean is not equal to 98.6
95 percent confidence interval:
 98.09007 98.22831
sample estimates:
mean of x 
 98.15919
 ```

We see that we get the same (or very similar) values for the t-statistic, degrees of freedom, and p-value as we did using the pt function. This confirms our decision to reject the null hypothesis at the alpha = 0.05 level and conclude that the mean healthy human body temperature is not 98.60 F.

### Deliverable 6: Create and interpret a 95% confidence interval for the true mean healthy human body temperature.  

Similarly, there are two ways to calculate a 95% confidence interval for the true mean healthy human body temperature. First, we can do it “the old fashioned way” by filling quantities into the confidence interval formula, and second, we can use the results of the t.test function we used earlier.

The only value we still need to calculate the 95% confidence interval is the critical value, t*, which we can find using the qt function. The qt function returns the t value (which we are calling t*) that corresponds to a specified area below that t value. For a 95% confidence interval, we want the value of t* such that 95% (0.95 when expressed as a decimal) of the data in our sampling distribution is between +/- t*.  That means, because of the symmetry of the t-distribution, that 2.5% (or 0.025 expressed as a decimal) of the data in the sampling distribution is below –t* and 2.5% is above t*. The only other value we need in the qt function is the number of degrees of freedom, which we have already determined to be 222.

```
t.star <- qt(0.025,222)

> t.star
[1] -1.970707
```

Now we can plug all the quantities into the confidence interval formula to find the estimate of the true mean human body temperature. In your R Script, type and run the following commands to calculate lower.cl and upper.cl. 

```
lower.cl <- xbar + t.star * se

> lower.cl
[1] 98.09007

upper.cl <- xbar – t.star * se

> upper.cl
[1] 98.22831
```

Our calculations are confirmed by the results of the `t.test` function from the previous deliverable (copied in part).

```
95 percent confidence interval:
 98.09007 98.22831
```

We are 95% confident that the true mean healthy human body temperature is between 98.09 and 98.230 F.
