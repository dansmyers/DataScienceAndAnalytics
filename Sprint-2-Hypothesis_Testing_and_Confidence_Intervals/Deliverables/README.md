# Sprint 2 &ndash; Deliverables

## Submission

Create **one** well-organized Word document containing your answer to each question, including your RStudio scripts. Upload it to the Sprint 1 Deliverable Assignment posted to Canvas.

At the beginning of the document, please include:

- Your name
- A statement of the Honor Code
- The names of your team members


## Premier League

<img src="https://upload.wikimedia.org/wikipedia/en/thumb/f/f2/Premier_League_Logo.svg/1200px-Premier_League_Logo.svg.png" width="50%" />

The English Premier League is the top level of the English professional metric football system.

A roster of players from the 2014-2015 Premier season is included in the `EPL.xlsx` dataset. We wish to estimate the mean height of all players using a SRS, a sample 
stratified by position played, and a cluster sample using team as the clustering variable and compare these estimates to the population mean.

Project deliverables:
1.	Import the `EPL.xlsx` dataset into R-Studio. Use the data dictionary to identify each variable in the dataset as categorical or quantitative. If the variable is categorical, 
further identify it as ordinal, nominal or an identifier variable. If the variable is quantitative, identify it as discrete or continuous. 

2.	Calculate the mean height of all Premier League players in 2014 - 2015.

3.	Select a simple random sample of 50 Premier League players and calculate the mean height.

4.	Draw a side-by-side boxplot displaying player height by position played.

5.	Create a relative frequency table showing the percent of Premier League players at each position.

6.	Select a stratified sample that includes 10% of the players at each position, and calculate the mean height for the sample.

7.	Calculate the mean height for each Premier League team.

8.	Select a cluster sample with three randomly selected Premier League teams, and calculate the mean height.

9.	Compare the mean height for the three samples to the mean height for the entire population of Premier League players during the 2014-2015 season.


## Soda

<img src="https://i.kym-cdn.com/photos/images/facebook/001/457/633/74e.jpg" width="50%" />

How standard is the caffeine content in fountain soft drinks served in chain restaurants?

Soft drinks like Coke and Pepsi are manufactured to have a standard caffeine content. For example, a 12-oz serving of Coke has 34mg of caffeine, and a 12-oz serving of Pepsi has 37.6mg of caffeine. However, fountain soft drinks are typically mixed in individual restaurant dispensers, so it is more difficult to maintain a standard level of caffeine per serving. In this study, researchers randomly sampled Coke, Diet Coke, Pepsi, and Diet Pepsi at a set of franchise restaurants and measured the caffeine content in 12oz of each soft drink. The data is found in the `Soda.xlsx` dataset.

Because individuals can be sensitive to caffeine &ndash; and because the manufacturers are interested in product consistency &ndash; we wish to test the null hypothesis that the mean caffeine content in 12oz of Coke served in franchise restaurants is 34mg versus the alternative hypothesis that the mean caffeine content in 12oz of Coke served in franchise restaurants is greater than the 34mg. 

Project deliverables:

1.	Import the `Soda.xlsx` dataset into R-Studio. Use the data dictionary to identify each variable in the dataset as categorical or quantitative. If the variable is categorical, further identify it as ordinal, nominal or an identifier variable. If the variable is quantitative, identify it as discrete or continuous. Create a subset called `Coke` that only includes caffeine measurements from regular Coke. 

2.	Identify the null and alternative hypotheses we wish to test.

3.	Identify the appropriate statistical test for these hypotheses. Verify that the assumptions for using that test are met.

4.	Calculate the sampling distribution of the sample mean under the null hypothesis.

5.	Conduct the hypothesis test and report your conclusion at the `alpha = 0.05` significance level.

6.	Create and interpret a 95% confidence interval for the true mean amount of caffeine found in fountain Coke.  


## Brains II

<img src="https://www.sbs.com.au/guide/sites/sbs.com.au.guide/files/styles/full/public/homer_brain_scan.jpg?itok=1YviyP61" width="50%" />

Does brain weight differ by age in healthy adult humans?

The `Brainhead.xlsx` dataset provides information on 237 individuals who were subject to post-mortem examination at the Middlesex Hospital in London around the turn of 
the 20th century1. Study authors used cadavers to see if a relationship between brain weight and other more easily measured physiological characterizes such as age, 
sex, and head size could be determined. The end goal was to develop a way to estimate a person’s brain size while they were still alive (as the living aren’t keen on 
having their brains taken out and weighed). We wish to determine if there is a relationship between age and brain weight in healthy human adults.

Project deliverables:

1.	Import the `Brainhead.xlsx` dataset (posted on Canvas) into R-Studio. Review the data dictionary to identify each variable in the dataset as categorical or quantitative. If the variable is categorical, further identify it as ordinal, nominal or an identifier variable. If the variable is quantitative, identify it as discrete or continuous. 

2.	Create a histogram of brain weight and calculate the appropriate summary measures to describe the distribution.

3.	Display the distribution of age graphically.

4.	Describe the distribution of age with a numerical summary.

5.	Draw side-by-side boxplots illustrating the distribution of brain weight by age. 

6.	Calculate and compare the mean and standard deviation of brain weight by age.

7.	Describe the hypothesis test you would use to test for a statistically significant difference in brain weight by age. 

8.	Identify the appropriate statistical test for your hypotheses in Deliverable 7, and determine if the assumptions for using this test are met. 

9.	Test for a statistically significant difference in brain weight by age at the 0.05 level.

10.	Calculate a 95% confidence interval for the difference in the mean brain weight for older and younger individuals. 

11.	Summarize your results about the relationship of age and brain weight in healthy adults.

References:

- Premier League Football. 2014. Premier League Football Player Statistics. www.premierleague.com

-	A.N. Garand and L.N. Bell (1997). "Caffeine Content of Fountain and Private-Label Store Brand Carbonated Beverages," *Journal of the American Dietetic Association*, Vol. 97, #2, pp. 179-182.

- R.J. Gladstone (1905). "A Study of the Relations of the Brain to the Size of the Head", *Biometrika*, Vol. 4, pp105-123.
