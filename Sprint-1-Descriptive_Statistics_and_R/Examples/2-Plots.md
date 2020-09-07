# Lab #2 &ndash; Plots

## Does use of antiseptics during surgery reduce mortality?


Spoiler alert – **yes**! Though this was actually very controversial at the time. Joseph Lister (the namesake of Listerine), an English surgeon in the late 1800s, pioneered the use of carbolic acid as an antiseptic during surgery after observing that it mitigated the smell of sewage waste used to irrigate farm fields with no apparent harm to the livestock grazing there.  

Mortality data for individuals who had upper or lower limb amputations before and after the discovery of antiseptics are presented in the `Lister.xlsx` dataset (posted to Canvas).

## Project deliverables:
1.	Use the data dictionary to identify each variable in the dataset as categorical or quantitative. If the variable is categorical, further identify it as ordinal, nominal or an identifier variable.

2.	Using the `ifelse` function covered in Lab 1, create a new variable called `Outcome.char` that takes on the value `Did Not Survive` when `Outcome == 0` and `Survived` when `Outcome == 1`. Create a second new variable called `Antiseptic.char` that takes on the value `Before Antiseptics` when `Antiseptic == 0` and `After Antiseptics` when `Antiseptic == 1`.

3.	Calculate the frequency and relative frequency of survival for the patients in Lister’s study.

4.	Calculate the frequency and relative frequency of the time period (before or after the discovery of antiseptics) in which the amputations were performed. 

5.	Create a bar chart to display the number of patients who survived and did not survive.

6.	Create a pie chart to display the percent of patients who had amputations performed before and after the discovery of antiseptics.

7.	Create a frequency table to show the joint distribution of survival and antiseptic use.

8.	Draw a side-by-side bar chart to show the number of patients who survived and did not survive a limb amputation before and after the discovery of antiseptics.

9.	Summarize your findings about the relationship of antiseptic use to the survival of an amputation.

## Deliverable 1: Use the data dictionary to identify each variable in the dataset as categorical or quantitative. If the variable is categorical, further identify it as ordinal, nominal or an identifier variable.

Using the methods detailed in Lab 1, import the `Lister.xlsx` dataset (after downloading it from Canvas and saving it to your computer) and open an R Script. Also open the file “Lister Data Dictionary”. 

The first variable in the dataset is `ID`, which identifies each unique participant. This is a categorical, identifier variable. The second variable is `Antiseptic`, which indicates if the amputation was performed before or after the discovery of antiseptics. This is a nominal categorical variable. The third variable is `Limb`, which indicates if the patient had a lower or upper limb amputated. This is a nominal categorical variable. The last variable is `Outcome`, which indicates if the patient survived or did not survive after the amputation. This is a nominal categorical variable.
  
## Deliverable 2: Using the `ifelse` function covered in Chapter 1, create a new variable called `Outcome.char` that takes on the value `Did Not Survive` when `Outcome == 0` and `Survived` when `Outcome == 1`. Create a second new variable called `Antiseptic.char` that takes on the value `Before Antiseptics` when `Antiseptic == 0` and `After Antiseptics` when `Antiseptic == 1`.

When creating tables and plots, it is often helpful to work with variables that have descriptive category names rather than 0, 1 codes. Type and run the following code in an R Script to create the `Outcome.char` and `Antiseptic.char` variables (review Lab 1 if you need additional help with the `ifelse` function).

```
Lister$Outcome.char <- ifelse( 
    test = (Lister$Outcome == 1), 
    yes = "Survived", 
    no = "Did Not Survive"
)

Lister$Antiseptic.char <- ifelse( 
    test = (Lister$Antiseptic == 1),
    yes = "After Antiseptics",
    no = "Before Antiseptics" 
)
```

## Deliverable 3: Calculate the frequency and relative frequency of survival for the patients in Lister’s study.

The table function is used to find the frequency (the number of observations) that fall in each category of a categorical variable. We use the statement `table(Lister$Outcome.char)` to calculate the number of patients who survived and did not survive after a lower or upper limb amputation. 

Type and run the statement `table(Lister$Outcome.char)` in your R Script and the following results will appear in the Console.

```
> table(Lister$Outcome.char)
Did Not Survive        Survived 
             22              53 
```

We can also apply the `prop.table` function to the table function to find the relative frequency (the proportion of observations) that fall in each category. Running the relevant code produces the following output in the Console.

```
> prop.table(table(Lister$Outcome.char))
Did Not Survive        Survived 
      0.2933333       0.7066667 
```

It can also be useful to multiply the results from the prop.table function by 100 so the relative frequencies are expressed as percents rather than proportions. 

```
> prop.table(table(Lister$Outcome.char)) * 100

Did Not Survive        Survived 
       29.33333        70.66667 
```

Fifty-three of the patients included in the study (about 71%) survived their amputations and 22 (about 29%) did not.

### Deliverable 4: Calculate the frequency and relative frequency of the time period (before or after the discovery of antiseptics) in which the amputations were performed. 

Similar to step 3, use the statement `table(Lister$Antiseptic.char)` to calculate the number of individuals who had amputations performed before and after the discovery of antiseptics. Running the relevant code produces the following output in the Console.
 
```
> table(Lister$Antiseptic.char)

 After Antiseptics Before Antiseptics 
                40                 35
```

Again, use the `prop.table` function to find the percent of patients who had amputations performed before and after the discovery of antiseptics. 

```
> prop.table(table(Lister$Antiseptic.char)) * 100
 
  After Antiseptics  Before Antiseptics 
            53.33333           46.66667 
```

Thirty-five individuals (about 47%) had amputations performed before the discovery of antiseptics, and 40 individuals (about 53%) had amputations performed after the discovery of antiseptics.

## Deliverable 5: Create a bar chart to display the number of patients who survived and did not survive.

One nice feature of R is how easy it is to make great looking figures. Below is the R code to create a bar chart displaying the number of patients who survived and did not survive after a limb amputation. We’ll walk through each statement in detail after you see the figure.

```
barplot(
	table(Lister$Outcome.char), 
   	main = "Patient Outcome After Limb Amputation", 
	xlab = "Outcome After Limb Amputation",
	ylab = "Number of Patients"
)
```

The barplot function creates a bar chart using the number of observations included in each bar. That’s why the first statement in the barplot function is `table(Lister$Outcome.char)` rather than just `Lister$Outcome.char`. We recommend writing and running the command `barplot(Lister$Outcome.char)` in place of `barplot(table(Lister$Outcome.char))` so you can see the difference. 

The `main =` argument specifies the main title for the chart, and the `xlab =` and `ylab =` arguments specify the appropriate labels for the x- and- y-axis, respectively.

## Deliverable 6: Create a pie chart to display the percent of patients who had amputations performed before and after the discovery of antiseptics.

Recall from Deliverable 3 that the command to calculate the percent of individuals in Lister’s study who survived and did not survive a limb amputation was `prop.table(table(Lister$Antiseptic.char)) * 100`. This is the first entry in the `pie()` function, which is used to generate a pie chart. As in a bar chart, `main =` is used to give the figure a main title.

We can also specify the colors for the wedges of the pie chart using `col =` . In addition to creating a visually pleasing graph (that might match the color scheme of a poster or PowerPoint presentation), it will allow us to match the legend text to the correct portion of the pie chart. Colors are specified after `col =` using a vector that contains the same number of colors as there are sections of the pie chart. R can produce graphics with an incredible array of colors, a comprehensive list of which can be found here: http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf. In this example, we will use the colors `darkblue` and `darkcyan`.

Type and run the following pie function in an R Script, which will produce Figure 2.2.

```
pie(
    prop.table(table(Lister$Antiseptic.char)) * 100,
    main = "Percent of Patients with Amputations Performed 
            Before and After the Discovery of Antiseptics",
    col = c("darkblue", "darkcyan")
)
```

While the pie chart gives us a general sense of the relative frequency of when individuals had their amputations performed (before or after the discovery of antiseptics), it is helpful to include the actual percent in each category on the graph. We can do this by adding a legend. 

The following R code will overlay a legend on the top right of the pie chart we just created.

```
legend(
    x = "topright", 
    legend = c("53.3 %", "46.7 %"),
    fill = c("darkblue", "darkcyan")
)
```

The first argument, `x =  “topright”`, places the legend in the top right corner of the graph. The next argument, `legend =`, specifies a vector containing the labels to be used in the legend. Looking back at the relative frequency of amputations performed during each time period (which we calculated in Deliverable 3), we see that 53.% of study participants had an amputation after the discovery of antiseptics and 46.7% had an amputation before the discovery of antiseptics. Finally, we specify the color of the markers in the legend so that they match those in the pie chart command using `fill =`.

Here is the complete R code to generate the pie chart:

```
pie(
    prop.table(table(Lister$Antiseptic.char)) * 100,
    main = "Percent of Patients with Amputations Performed 
            Before and After the Discovery of Antiseptics",
    col = c("darkblue", "darkcyan")
)

legend(
    "topright", 
    legend = c("53.3 %", "46.7 %"),
    fill = c("darkblue", "darkcyan")
)
```

Note that the pie function generates the actual pie chart and the legend function overlays the legend on top of the pie chart. If you edit the legend, you’ll have to re-run the pie function so you have a “clean slate” on which to overlay the revised legend.

## Deliverable 7: Create a frequency table to show the joint distribution of survival and antiseptic use.

We can determine the joint distribution of survival and antiseptic use by modifying the table function to include both variables of interest separated by a comma. Running the relevant code produces the following output in the Console.

```
> table(Lister$Outcome.char, Lister$Antiseptic.char)
                 
                  After Antiseptics Before Antiseptics
  Did Not Survive                 6                 16
  Survived                       34                 19
```

Before the discovery of antiseptics, 16 individuals did not survive after a limb amputation and 19 did. After the discovery of antiseptics, 6 individuals did not survive after a limb amputation and 34 did.

Note that, while you can switch the order of the variables in the table function above and still have a perfectly useful table (with the rows and columns switched), we have chosen this particular ordering because it will be helpful when we create our bar chart in the next deliverable.

## Deliverable 8: Draw a side-by-side bar chart to show the number of patients who survived and did not survive a limb amputation before and after the discovery of antiseptics.

The barplot function can also make side-by-side and stacked bar charts when you want to compare the frequency of one variable grouped by another. This is done plotting the results of a two-by-two table such as the one we created in Deliverable 7. The first variable in the table function will be the one graphed on the y-axis, and the second will be used as categories to create the stacked or side-by-side bars. Because we want to compare survival grouped by whether the amputation was performed before or after the discovery of antiseptics, the table in the barplot function should read `table(Lister$Outcome.char, Lister$Antiseptic.char)` (which is what we wrote in Deliverable 7).

The following R code will generate a side-by-side bar chart of patient outcome by time period with a main title, and x-axis and y-axis labels. The argument `beside = TRUE` indicates that we want a side-by-side rather than stacked bar chart, and the argument `legend.text = TRUE` will automatically add a legend to the bar chart.

```
barplot(
    table(Lister$Outcome.char,Lister$Antiseptic.char), 
    main="Patient Survival by Antiseptic Use", 
    beside = TRUE, 
    legend.text = TRUE,
    xlab = "Time Period",
    ylab = "Number of Patients"
) 
```

## Deliverable 9: Summarize your findings about the relationship of antiseptic use to the survival of an amputation.

Before the discovery of antiseptics, about half of the patients who had a limb amputation survived and half did not survive. However, after the discovery of antiseptics, many more individuals survived after an amputation than did not survive. 
