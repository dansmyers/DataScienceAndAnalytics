# Lab #3 &ndash; Data Distributions, Histograms, and Boxplots

## Determine the casualty rate for Union Army soldiers in companies from Ohio during the US Civil War.

<img src="https://cdn.vox-cdn.com/thumbor/QLNPVrHIHh4B9di6ASQFwhs5u8s=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/13074961/civil_war_troops.0.0.0.0.1526055161.jpg" width="50%" />

Approximately 618,000 Union and Confederate soldiers died in battle and from starvation and disease during the single bloodiest conflict in United States history: The Civil War. To put this in perspective, about 400,000 US soldiers perished during the second-most-deadly conflict, World War II. Despite the terrible conditions soldiers faced in the field, remarkably good records about these men, their backgrounds, and their fates have been preserved.  

The `Ohio.xlsx` dataset contains records from 45 companies from Ohio during the United States Civil War including the number of soldiers in the company, the year the company was formed, details about the demographic make-up of each company as well as the overall mortality and mortality due to injury and illness. We wish to describe the mortality rates for these companies from Ohio during the US Civil War.

## Project deliverables:
1.	Use the data dictionary to identify each variable in the dataset as categorical or quantitative. If the variable is categorical, further identify it as ordinal, nominal or an identifier variable. If the variable is quantitative, identify it as discrete or continuous.

2.	Create and describe a histogram showing the distribution of total mortality for the 45 Ohio companies.

3.	Based on the shape of the distribution of total mortality, determine and calculate the appropriate measures of center and spread for the data. How many soldiers did a company “typically” lose?

4.	Create and describe a histogram showing the distribution of the number of soldiers in each of the 45 Ohio companies.

5.	Using the definition of an outlier as any point more than 1.5 times the interquartile range above Q3 or below Q1, explore any outliers present.  

6.	Calculate and describe the percent mortality in the 45 Ohio companies.

7.	Draw conclusions about the casualty rate for Union Army soldiers in companies from Ohio during the US Civil War.

## Deliverable 1: Use the data dictionary to identify each variable in the dataset as categorical or quantitative. If the variable is categorical, further identify it as ordinal, nominal or an identifier variable. If the variable is quantitative, identify it as discrete or continuous.

Using the methods we learned in Lab 1, import the `Ohio.xlsx` dataset.  Also open an RScript and the “Ohio Data Dictionary” file. 

- The first variable in the dataset is `Company`. Company is a categorical variable that provides the name of each unique company; therefore, it is an identifier variable. 
- The second variable is `No_soldiers`, the number of soldiers in the company. This variable is quantitative because it measures the number of soldiers in the company, and is discrete because “number of soldiers” is something that can be counted in a finite amount of time. 
- The third variable is `Enlist_yr`, which is a categorical variable that identifies each company as having been formed in 1861, 1862, 1863 or 1864. Because it only makes sense to think of those years in that order, Enlist_yr is an ordinal variable. 
- The fourth, fifth and sixth variables are `Death_total`, `Death_illness` and `Death_injury`. Like `No_soldiers`, these are discrete, quantitative variables that count the total number of deaths, the number of deaths from illness, and the number of deaths from injury, respectively, in each company.
- The fifth variable is `Pct_farmers`, which is a continuous, quantitative variable that measures the percent of soldiers in each company who were farmers. Percent is a continuous measure because it can take on values like 36.52% and can’t be counted like number of deaths and number of soldiers can.
- Similarly, the last variable, `Pct_foreign`, is also a continuous, quantitative variable.  

## Deliverable 2: Create and describe a histogram showing the distribution of total mortality for each of the 45 Ohio companies.  

Histograms are created using the hist function. In an R Script, type and run the statement below to produce the histogram.

```
hist(
    x = Ohio$Death_total,
    main = "Total Mortality: Ohio Companies, US Civil War", 
    xlab = "Total number of deaths",
    ylim = c(0, 20)
)
```

The first argument, `x = Ohio$Death_total`, is the variable we wish to use to create the histogram. As with the bar charts and pie charts we created in Lab 2,  `main =` allows you to specify the main title of the plot, and `xlab =` and `ylab =` specify the x-axis and y-axis labels. You can also change the range of the y-axis using `ylim = c(smallest value, largest value)`.  The range of the x-axis can be modified similarly using `xlim =`.

## Deliverable 3: Based on the shape of the distribution of total mortality, determine and calculate the appropriate measures of center and spread for the data. How many soldiers did a company “typically” lose?

The distribution of total mortality is skewed to the right with most companies sustaining between one and five casualties and just a few sustaining between 30 and 35. Because the distribution of the data is clearly not Normal, the median will be a better descriptor of the “typical” number of casualties and the interquartile range (IQR) will be a better descriptor of how variable the number of casualties was among the companies.  

Type and run the command `fivenum(Ohio$Death_total)` in your R Script to calculate the 5-number summary for `Death_total` in the order min, Q1, median, Q3, max.   

```
> fivenum(Ohio$Death_total)
[1]  0  4  7 17 34
```

From this, we see that these Ohio companies “typically” lost 7 men, with some losing as few as 0 and as many as 34. The middle 50% of companies lost between 4 and 17 soldiers.  

In comparison, the mean number of deaths (calculated using the mean function) was quite a bit higher than the median.

```
> mean(Ohio$Death_total)
[1] 10.75556
```

The skewed nature of the data makes the mean a less accurate measure of center than the median.

While completing this deliverable goes a long way toward answering the research question posed in the project description, it leaves out an important piece of context: How big were these companies to begin with? Every individual death is a tragedy, but losing 34 soldiers out of 10,000 is much different from a military perspective than losing 34 out of 70.

## Deliverable 4: Create and describe a histogram showing the distribution of the number of soldiers in each of the 45 Ohio companies.

To do this, we will use the hist function again. Using methods we’ve seen before, we give this histogram a title, modify the x- and- y-axes and label the x-axis. Type and run the following command in your R Script.

```
hist(
    x = Ohio$No_soldiers,
    main = "Number of Soldiers: Ohio Companies, US Civil War", 
    ylim = c(0,20),
    xlim = c(0,200), 
    xlab = "Number of soldiers in each company"
)
```

From the histogram, we see that most of the companies had close to 100 soldiers, in some cases more than 150. In at least one case, a company had very few soldiers, possibly less than 10.  

## Deliverable 5: Using the definition of an outlier as any point more than 1.5 times the interquartile range above Q3 or below Q1, explore outliers present.

We can use the results of the five number summary to identify potential outliers in the data. Running the relevant code produces the following output.

```
> fivenum(Ohio$No_soldiers)
[1]  10  87 100 111 180
```

The IQR is calculated as 111 – 87 = 24. Any observations smaller than 51 (Q1 – 1.5 * 24) or larger then 147 (Q3 + 1.5 * 24) is considered an outlier. Both the minimum and maximum values (and possibly other points) are outliers. Again, “outliers” aren’t necessarily errors. They are just points that are just particularly large or small compared to the bulk of the data. 

Creating a box plot in addition to a histogram allows us to view the distribution of No_soldiers in a different way. Of particular interest for this deliverable is that boxplots identify observations that are outliers as little circles.

The `boxplot()`  function displays the distribution of a variable using a boxplot. We see the same statements used to specify the title of the plot and the label for the x-axis. One notable addition is the use of `horizontal = TRUE` which orients the boxplot horizontally rather than vertically. This is simply an aesthetic choice.

```
boxplot(
    x = Ohio$No_soldiers, 
    main = "Number of Soldiers: Ohio Companies, US Civil War",
    horizontal = TRUE, 
    xlab = "Number of soldiers in each company"
)
```

We see from the circles appearing on the box plot that there is at least one observation on the small side of the distribution and several observations on the large side that are considered outliers.

At this point we should be curious about the very large and very small observations. But what to do? There are two possibilities for what is going on here: 

- The first is that these observations are unusual but correct. There were very large and very small companies in Ohio during this period of the US Civil War. 
- The second possibility is that there is an error in the data or data analysis.

We’ll explore the second case – that the unusual observations are the result of errors – first and then, if we can’t find any errors, we’ll do what we can to confirm that the outliers are correct. When investigating errors, it’s useful to start at the point you noticed the potential error and then work backwards toward the original source of the data to see if you can identify where an error might have been introduced.  

The first thing to consider is that we made an error with our plots or calculations. We can run `View(Ohio)`, and, because there are only 45 observations, we can scroll through the spreadsheet view of the data and see that there is one company with 180 soldiers and one with only 10 soldiers. We have not made an error plotting or calculating the summary measures.

The next possibility is that there was an error reading in the data from Excel into RStudio. To check this, we can open the `Ohio.xlsx` file and look at the data there. Again, we see Company 78D has 180 soldiers and Company 195B as 10 soldiers. So there is not an error reading in the dataset from Excel.

Now we must consider a possible error converting the data from its previous form into the Excel spreadsheet. The dataset is taken from this paper:

> C. Lee (1999). "Selective Assignment of Military Positions in the Union Army: Implications for the Impact of the Civil War", Social Science History, Vol. 23, #1, pp 67-97.

Does the data in our current Excel spreadsheet match what is reported in that paper? At this point, I encourage you to use your library’s web reference to obtain a copy and examine Table 3. Again, with 45 observations, it’s not too time consuming to check every record to make sure that the data in the table matches the data in the Excel spreadsheet.  

We see in Table 3 of the paper that nearly all of the records for “number of soldiers” match, including Company 78D with 180 soldiers. However, if we look at the second page of Table 3, **we see that Company 195B has 100 soldiers, not 10 soldiers**. We have found an error, and we can confidently edit the `Ohio.xlsx` dataset to change the number of soldiers in Company 195B to 100. 

Remove the old, incorrect version of the Ohio dataset from RStudio by typing and running `rm(Ohio)` in your RScript. Then import the corrected version.

What about the larger companies? The fact that they appear in a table of a peer-reviewed publication should give us confidence that they are correct. Dr. Lee does not comment in this paper about the differing size of the companies. He does, however, mention statistical differences in mortality between companies that were formed earlier and later in the war. A quick look at the data indicates that the larger companies were formed earlier rather than later in the war. This seems to be a reasonable explanation for why the companies were larger. They were simply in existence longer and had more opportunity for men to be assigned to them. At this point, we can conclude with confidence that the large observations are unusual but correct.

Using the corrected version of the dataset, we can examine the distribution of the size of each company using a histogram, boxplot and calculated summary measures.

```
hist(
    x = Ohio$No_soldiers,
  	 main ="Number of Soldiers: Ohio Companies, US Civil War", 
  	 ylim = c(0,20),
  	 xlab = "Number of soldiers in each company"
)

boxplot(
    x = Ohio$No_soldiers, 
    main = "Number of Soldiers: Ohio Companies, US Civil War",
    horizontal = TRUE, 
    xlab = "Number of soldiers in each company"
)
```

The distribution is skewed to the right with most companies having between 87 and 111 soldiers.  Some had as few as 72 soldiers and some as many as 180.  This is confirmed by calculating the summary measures.

```
> fivenum(Ohio$No_soldiers)
[1]  72  87 100 111 180

> mean(Ohio$No_soldiers)
[1] 105
```

Again, we note that the median is a better measure of center than the mean because the data is skewed.

## Deliverable 6: Calculate and describe the percent mortality in the 45 Ohio companies.

Although our original question wasn’t phrased this way, we are beginning to see what we are really trying to answer isn’t, “How many casualties were there in these Ohio companies?”. Because there was quite a bit of variation in company size, we need to answer the question “What percent of the soldiers in each company died during the war?” This is often true in statistical analyses. The relative frequency (or percent) of an occurrence often tells us more than the raw frequency (or count).

To gain insight into the relative frequency of deaths due to any cause, we can create a new variable by dividing the total number of deaths by the number of soldiers in each company and multiplying by 100%. 

```
Ohio$Pct.dead <-(Ohio$Death_total / Ohio$No_soldiers) * 100
```

Once we’ve added the variable to the Ohio dataset, it should be added to the data dictionary as well.

We can now create a histogram and calculate summary statistics for the percent of soldiers who died from all causes. Type and run the following command in an R Script.

```
hist(
x = Ohio$Pct.dead, 
  	main = "Percent casualties: Ohio Companies, US Civil War",
  	xlab = "Percent Dead"
)
```

From the histogram, we see the distribution of the data is skewed right. Most companies had less than a 10% mortality rate but one company had at least a 30% mortality rate.

We can use the fivenum function to further quantify the death rate.

```
> fivenum(Ohio$Pct.dead)
[1]  0.000000  4.494382  6.896552 14.545455 30.088496
```

## Deliverable 7: Draw conclusions about the casualty rate for Union Army soldiers in companies from Ohio during the US Civil War.

A company from Ohio typically had a casualty rate of about 7%, and 25% of companies lost fewer than a 5% of their men. Only 25% of companies had a casualty rate of more than 14%, but one company lost 30% of its men. Note that the skewed nature of the data makes the median (7%) a better measure of the “typical” casualty rate than the mean (more than 9%).
