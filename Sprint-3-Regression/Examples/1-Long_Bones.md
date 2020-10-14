# Long Bones (the Weirdest Example of All Time)

Scatterplots, linear correlation and regression allow us to determine the straight-line relationship between two quantitative variables. Scatterplots visualize the relationship between the two variables and give us a general sense of how they vary in relation to one another. A regression line is a mathematical model that uses the value of one variable (called the independent or explanatory variable, interchangeably) to predict the value of the other variable (called the dependent or response variable, interchangeably). Correlation and R<sup>2</sup> measure the strength of the linear relationship modeled by the regression line. They allow us to determine if there is a strong, weak or no association between the independent and dependent variables.

In this chapter, students will use RStudio to create a scatterplot to display the relationship between two quantitative variables and calculate their correlation. They will determine the regression equation that relates two quantitative variables and use it to predict the value of the response variable for a particular value of the explanatory variable. Finally, students will calculate R<sup>2</sup> and draw conclusions about the ability of one variable to predict the other.  

## Introduction

Scatterplots, linear correlation and regression allow us to determine the straight-line relationship between two quantitative variables. Scatterplots visualize the relationship between the two variables and give us a general sense of how they vary in relation to one another. A regression line is a mathematical model that uses the value of one variable (called the independent or explanatory variable, interchangeably) to predict the value of the other variable (called the dependent or response variable, interchangeably). Correlation and R<sup>2</sup> measure the strength of the linear relationship modeled by the regression line. They allow us to determine if there is a strong, weak or no association between the independent and dependent variables.

## Scatterplots and Linear Regression

The first step in linear regression is to determine which variable in the dataset is the explanatory variable and which is the response variable. Usually this is done through careful reading of background information or as you develop your research question. In general terms, the explanatory or independent variable is the one you wish to use to predict the response or dependent variable. It is important to be clear on which variable is which because switching them in the regression model will produce totally different (and incorrect!) results. 

Once you have identified the explanatory and response variables, you must check the conditions for modeling the data using linear regression. First, the two variables must be quantitative. Linear regression is not the model to use if you want to examine the relationship between one or more categorical variables. Second, the relationship between the two variables should be linear. Third, there should be no outliers in the data. 

The most direct way to test the conditions for linear regression is by creating a scatterplot. A scatterplot graphs each ordered pair (independent variable, dependent variable), allowing you to see if the data points fall more or less in a straight line (with either a positive or negative trend), have a curved (nonlinear) relationship, or have no relationship and look like a cloud of points. Violations of the conditions for linear regression are typically obvious from a scatterplot (and a residual plot), and later we’ll discuss what to do if this happens.

Once you’ve determined that it is appropriate to model your data using linear regression, R makes it very easy to calculate the slope and intercept terms and predict the mean response for a particular value of the independent variable. 

## The Correlation Coefficient (r) and the Coefficient of Determination (R<sup>2</sup>)


The correlation coefficient (also called the correlation or r, interchangeably) and the coefficient of determination (also called R<sup>2</sup>) are related mathematically (R<sup>2</sup> is the square of the correlation) and they measure the strength of the linear relationship between two quantitative variables in slightly different ways. Correlation measures the relationship between the two variables on a scale of -1 to 1 with -1 and 1 being the strongest relationships (negative and positive, respectively) and 0 being no relationship. A correlation of exactly -1 or exactly 1 would mean that all the data points fell in a straight line. 

R<sup>2</sup> is measured on a scale of 0 to 1 (recall that the square of a negative number is positive) and is usually expressed as a percent from 0% to 100%. R<sup>2</sup> tells us the percent of variation in the response variable that is explained by differences in the explanatory variable. If R<sup>2</sup> is close to 100%, then knowing what the independent variable is tells us almost everything we need to know to estimate the value of the dependent variable. In contrast, if R<sup>2</sup> is small, then there is missing information in our model that would, if present, allow us to do a better job predicting the dependent variable. 

## Guided Project 1:  Can forensic scientists determine how long a body has been buried by how much nitrogen remains in the long bones of the skeleton?

Anyone who is a fan of detective TV shows has watched a scene where human remains are discovered and some sort of expert is called in to determine when the person died. But is this science fiction or science fact? Is it possible to use evidence from skeletal remains to determine how long a body has been buried (a decent approximation of how long the person has been dead)? 

Researchers sampled long bone material from bodies exhumed from coffin burials in two cemeteries in England. In each case, date of death and burial (and therefore interment time) was known. This data is given in the `Longbones.xlsx` dataset. We wish to determine if there is a relationship between the nitrogen composition of the long bones of the skeleton and the length of time the body was interred.
   
### Project deliverables:
1. Import the `Longbones.xlsx` dataset into R-Studio. Use the data dictionary to identify each variable in the dataset as categorical or quantitative. If the variable is categorical, further identify it as ordinal, nominal or an identifier variable. If the variable is quantitative, identify it as discrete or continuous.

2. Create a scatterplot to display the relationship between long bone nitrogen composition and length of interment. Describe any patterns apparent from the scatterplot.

3. Study authors were concerned that contamination with fuel oil might change the relationship between long bone nitrogen composition and length of interment. On the scatterplot, identify the three skeletons that were contaminated with fuel oil using a different color dot. The study authors decided to remove these observations from analysis. Do you agree?

4. Create a new dataset using only records of remains that were not contaminated by fuel oil. Use this dataset to complete Deliverables 5 – 10. Are the conditions met to model the relationship using correlation and linear regression?

5. Calculate the correlation between long bone nitrogen composition and length of interment.

6. Determine the regression equation that relates long bone nitrogen composition and length of interment. Interpret the slope and intercept of the line.

7. Create a scatterplot to show the relationship between long bone nitrogen composition and interment length, and annotate it with the regression line and correlation.

8. Create a residual plot and look for potential violations of the conditions for linear regression.

9. Use the regression line to determine the expected mean interment time for a body discovered with a long bone nitrogen composition of 3.71g/100g of bone.  

10. Calculate R<sup>2</sup> for this relationship. Does long bone nitrogen composition seem to be a good predictor of length of interment?  

### Deliverable 1: Import the Longbones.xlsx dataset into R-Studio. Use the data dictionary to identify each variable in the dataset as categorical or quantitative. If the variable is categorical, further identify it as ordinal, nominal or an identifier variable. If the variable is quantitative, identify it as discrete or continuous. 

The first variable is Site, which is a nominal categorical variable identifying from which of two sites the remains were exhumed. The second variable is Time, which is a quantitative, continuous variable measuring the time the body was interred in years. The third variable is Depth, which is a quantitative, continuous variable measuring the depth at which the body was buried. The fourth variable is Lime, which is a nominal, categorical variable indicating if the body was buried with Quicklime. The fifth variable is Age, which is a quantitative, continuous variable recording the age at the time of death (though this was unknown in some cases). The sixth variable is Nitro, which is a quantitative, continuous variable measuring the nitrogen composition in the femur of the skeleton in g/100g of bone. The seventh variable is Oil, which is a nominal, categorical variable that indicates if the burial site was contaminated with fuel oil. 
 
### Deliverable 2: Create a scatterplot to display the relationship between long bone nitrogen composition and length of interment. Describe any patterns apparent from the scatterplot.

We use the plot function to create a scatterplot for long bone nitrogen composition and length of interment. The first variable entered in the plot function is the independent variable, which will appear on the x-axis, and the second variable is the dependent variable, which will appear on the y-axis. Because we are trying to predict length of interment from long bone nitrogen composition, nitrogen composition is treated as the independent variable and length of interment as the dependent variable. The other plotting statements should be familiar by now. Type and run the following statement to produce Figure 6.1.

```
plot(
    x = Longbones$Nitro, 
    y = Longbones$Time,
    main = "Long Bone Nitrogen Composition and 
		Length of Interment", 
    Ylim = c(0,100),
    Xlim = c(3,4.5),
    Xlab = "Nitrogen Composition in g per 100g of Bone", 
    Ylab = "Length of Interment in Years"
)
```

The plotted points exhibit a linear trend suggesting a negative linear relationship between long bone nitrogen composition and length of interment. In bodies with longer interment time, there is either greater variability in the nitrogen composition of the long bones or possibly a few outliers.
 
### Deliverable 3: Study authors were concerned that contamination with fuel oil might change the relationship between long bone nitrogen composition and length of interment. On the scatterplot, identify the three skeletons that were contaminated with fuel oil using a different color dot. The study authors decided to remove these observations from analysis. Do you agree?

To color the dots of the burial sites contaminated with fuel oil, we need to create a new variable that assigns the burial sites that were not contaminated to have `Color = 1` and the sites that were contaminated to have `Color = 2`. Type and run the following statement in your R Script.

```
Longbones$Color <- Longbones$Oil + 1
```

In the plot statement, we determine which colors we wish to use for the contaminated and uncontaminated burial sites (in this case we’ll use red and black, respectively) and in brackets type `[Longbones$Color]` to indicate that is the variable we wish to use to identify which points should be colored differently. Points where Color = 1 will be printed in black and points where Color = 2 will be printed in red.  

We can also add a legend to indicate what each color means. For a more thorough discussion of the legend() function, see Chapter 2 Guided Project Deliverable 6.

The full statement to type and run in your R Script is:  

```
plot(
    x = Longbones$Nitro,
    y = Longbones$Time,
    main = "Long Bone Nitrogen Composition and 
		Length of Interment",
    ylim = c(0,100), 
    xlim = c(3,4.5), 
    xlab = "Nitrogen Composition in g per 100g of Bone",    
    ylab = "Length of Interment in Years",   
    col = c("black","red")[Longbones$Color]
)

legend(
    x = "bottomleft",
    legend = c("No Contamination","Oil Contamination"),
    fill = c("black","red")
)
```

All three oil-contaminated skeletons (appearing in the figure as red dots) were interred for about 80 years and had between 3.75 to 4.0 g of nitrogen per 100g of bone remaining in their long bones. Because there are chemical and biological reasons that the oil contamination could alter the natural relationship between long bone nitrogen concentration and length of interment, it makes sense to remove those points from the analysis.  

### Deliverable 4: Create a new dataset using only records of remains that were not contaminated by fuel oil. Use this dataset to complete Deliverables 5 – 10. Are the conditions met to model the relationship using correlation and linear regression?

We’ll create our new dataset using the subset function where Oil == 0. 

```
Longbones.subset <-
subset(
     x = Longbones, 
     subset = (Longbones$Oil == 0)
)
```

Both variables are quantitative, the scatterplot doesn’t show any strong non-linear shape and we have removed three outliers from the data. All of the conditions for modeling the relationship between long bone nitrogen composition and interment time using linear regression are met.

### Deliverable 5: Calculate the correlation between long bone nitrogen composition and length of interment.

The `cor` function is used to calculate the correlation between two variables. It doesn’t matter what order they are entered in the function. 

```
> cor(Longbones.subset$Nitro,Longbones.subset$Time)
[1] -0.6961346
```

The correlation between long bone nitrogen composition and length of interment is about -0.70, which indicates a moderately strong negative linear relationship.

### Deliverable 6: Determine the regression equation that relates long bone nitrogen composition and length of interment. Interpret the slope and intercept of the line.

We use the `lm` function to fit a regression line to the data. The variables (names only, the dataset is specified later in the `lm` function) are entered in the order `y ~ x`, and, unlike correlation, it is very important that they are entered in that order. Again, because we are trying to predict length of interment from long bone nitrogen composition, length of interment is treated as the y variable and entered first and nitrogen composition is treated as the x variable and entered second. The dataset is named in the `dataset=` entry. 

At this point we’ll go ahead and name the regression model because we will need to call it later for other deliverables. To see the results, just type the name of the model. 

```
> Longbones.reg <- lm(Time ~ Nitro, data = Longbones.subset)
> Longbones.reg

Call:
lm(formula = Time ~ Nitro, data = Longbones.subset)

Coefficients:
(Intercept)        Nitro  
     335.47       -74.26 
```

The results return the coefficient of the intercept and the slope. Rewriting them as a model, we have 

```
y ̂= 335.47 - 74.26 x
```

The slope term tells us that, for every additional gram of nitrogen per 100g of bone found in the long bones of a skeleton, we would expect the body to have been interred for about 74.26 fewer years. The intercept tells us what the interment time would be for a skeleton with a long bone nitrogen composition of 0 grams per 100g of bone. Because a nitrogen composition of 0 g per 100g of bone is outside the range of the data collected, it doesn’t make sense to interpret the y-intercept. 

### Deliverable 7: Create a scatterplot to show the relationship between long bone nitrogen composition and interment length, and annotate it with the regression line and correlation.

Here is the R code to create the scatterplot using the subset of records that were not contaminated with fuel oil.

```
plot(
    x = Longbones.subset$Nitro,
    y = Longbones.subset$Time,
    main = "Long Bone Nitrogen Composition and 
            Length of Interment",
    ylim = c(0,100),
    xlim = c(3,4.5), 
    xlab = "Nitrogen Composition in g per 100g of Bone",
    ylab = "Length of Interment in Years"
)
```

To amend the scatterplot so that it includes both the regression line and correlation, we need to use two additional functions. The first is the `abline` function which will draw the regression line on top of the scatterplot. The `abline` function will print any line on a graph, but in this case we specifically want to print the results of the regression model which we named `Longbones.reg`.

The second function we need is `text`, which will print the formula for the regression equation as well as the correlation. The first two entries in each text function are the x- and y-positions for the center of the textbox on the graph. We will center the top text entry at the (x,y) coordinate (3.3 g/100g of bone, 20 years) and the second text entry at the (x,y) coordinate (3.3 g/100g of bone, 10 years). 

The expression function in each of the text entries allow us to include mathematical symbols in the text added to the graph. `hat(y)` adds the small "hat" symbol
to y in the printed text. The syntax to generate other special characters can be found at https://stat.ethz.ch/R-manual/R-patched/library/grDevices/html/plotmath.html


```
abline(Longbones.reg)

text(
    x = 3.3, 
    y = 20, 
    expression(hat(y) == 335.47 - 74.26*x)
)
      
text(
    x = 3.3, 
    y = 10, 
    expression(r == 0.70)
)
```

### Deliverable 8: Create a residual plot and look for potential violations of the conditions for linear regression.

When R models a regression line, it computes lots of ancillary data that can be used for other analyses. For example, `Longbones.reg$residuals` is a vector of all the residuals for the `Longbones.reg` regression model.

We can then plot nitrogen composition (the x-variable) on the x-axis against the model residuals by entering `Longbones.reg$residuals` as the y-variable. 

The `abline` function is also useful here too to add a horizontal line at y = 0 (specified as h = 0) on the residual plot.

```
plot(
    x = Longbones.subset$Nitro,
    y = Longbones.reg$residuals, 
    main = "Residual Plot for the Relationship Between Long  
		Bone Nitrogen Composition and Interment Time", 
    xlab = "Nitrogen Composition in g per 100 g of Bone", 
    ylab = "Regression Model Residuals"
)

abline(h=0)
```

There do not appear to be any outliers in the data or any curved pattern that would indicate a nonlinear relationship between long bone nitrogen composition and interment time.

### Deliverable 9: Use the regression line to determine the expected mean interment time for body discovered with a long bone nitrogen composition of 3.71g/100g of bone.  

R also has a function that will calculate y ̂ for a specified value of x called predict. The first entry in predict is the regression model we developed earlier.  

The second entry specifies the value of x we wish to model, and it has to be written in a specific way that is a bit different than other functions we’ve used. The format is `newdata = data.frame(variable name = value)`. This can be a bit confusing because `newdata` should be typed just was written, but `variable name` should be replaced with your actual x-variable name and `value` should be replaced with your actual x-variable value. 

```
> predict(
    Longbones.reg,
    newdata = data.frame(Nitro = 3.71)
)

[1] 1.198001
```

Based on our regression model, the average interment time for a body discovered with a long bone nitrogen composition of 3.71g/100g of bone is about 1.20 years.

### Deliverable 10: Calculate R<sup>2</sup> for this relationship. Does long bone nitrogen composition seem to be a good predictor of length of interment?  

The summary function provides a lot of information about a regression model and can be used to determine the value of R<sup>2</sup>, the Coefficient of Determination. 

```
> summary(Longbones.reg)$r.squared
[1] 0.4846034
```

R<sup>2</sup> tells us that about 48% of the variability in length of interment can be explained by differences in the nitrogen composition in the long bones. This makes biological sense because the more nitrogen that has decomposed in the bones, the longer the person has been dead and buried.  

After examining the scatterplot and residual plot and removing outliers, it makes sense to model the relationship between long bone nitrogen composition and interment length with a linear regression model. However, because more than 50% of the variability in interment length is still unexplained by the model, we should think about expanding our model to include other potential predictors such as age at the time of death (which is, alas, beyond the scope of this book). 
