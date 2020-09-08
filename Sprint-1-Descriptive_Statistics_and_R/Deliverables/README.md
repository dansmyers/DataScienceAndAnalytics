# Sprint 1 &ndash; Deliverables

## Submission

Create **one** well-organized Word document containing your answer to each question, including your RStudio scripts. Upload it to the Sprint 1 Deliverable Assignment posted to Canvas.

At the beginning of the document, please include:

- Your name
- A statement of the Honor Code
- The names of your team members

## I Promise I'll Only Make You Do This One Time

Calculate, **by hand**, the five number summary and variance of the following data set:

```
3.5
9.1
9.5
8.3
8.2
8.7
4.4
6.7
2.5
4.4
6.7
```

Disclaimer: I may also ask you to do something like this on the quiz.

## My Heart Will Go On

<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/fd/RMS_Titanic_3.jpg/2560px-RMS_Titanic_3.jpg" width="50%" />

In the early hours of April 15, 1912, the "unsinkable" ship RMS *Titanic* sank when it struck an iceberg, killing more than half of the passengers and crew aboard.

The `Titanic.xlsx` dataset contains demographic information for 889 of those passengers as well as a record of whether or not each passenger survived. Our goal is to describe the distributions of passenger ticket class and passenger survival.

### Download the Dataset

If you have not already done so, go to Canvas and download `Titanic.xlsx` and then save it into the same directry as your other class project files.

### Steps

1.	Use the data dictionary file posted to Canvas to identify each variable in the dataset as categorical or quantitative. If the variable is categorical, further identify it as ordinal, nominal or an identifier variable.

2.	Using the `ifelse` function covered in the first lab, create a new variable called `Survived.char` that takes on the value `Did Not Survive` when `Survived == 0` and `Survived` when `Survived == 1`.

3.	Calculate the  frequency and relative frequency of survival for *Titanic* passengers.

4.	Calculate the frequency and relative frequency of passengers in each ticket class.

5.	Create a bar chart to display the number of passengers who survived and did not survive the *Titanic* sinking.

6.	Create a pie chart to display the percent of passengers who traveled under each ticket class.

7.	Create a frequency table to show the joint distribution of survival and passenger ticket class.

8.	Draw a side-by-side bar chart to show the number of passengers in each ticket class who survived and did not survive. You can use the argument 
`args.legend = list(x="topleft"))` to move the legend to the top left of the graph.

9.	Summarize your findings about survival on the *Titanic* and how a passenger’s ticket class might have affected his or her survival.

### Tips

<img src="https://i.imgur.com/k7Rqy.jpeg" width="50%" />


Review the material for labs 1 and 2. Lab 1 covers importing the dataset into R Studio and creating new variables and subsets. Lab 2 gives examples of plots and frequency tables.


## Brains

<img src="https://i.redd.it/e0abfjlvh8221.jpg" width="30%" />

The `Brainhead.xlsx` dataset (posted to Canvas) provides information on 237 individuals who were subject to post-mortem examination at the Middlesex Hospital in London around the turn of the 20th century. Study authors used cadavers to see if a relationship between brain weight and other, more easily measured, physiological characterizes such as age, sex, and head size could be determined. The end goal was to develop a way to estimate a person’s brain size while they were still alive (as the living aren’t keen on having their brains taken out and weighed). We wish to use this data to determine the weight of a “typical” human brain. 

## Steps

1.	Download and import the `Brainhead.xlsx` dataset into RStudio. Use the data dictionary to identify each variable in the dataset as categorical or quantitative. If the variable is categorical, further identify it as ordinal, nominal or an identifier variable. If the variable is quantitative, identify it as discrete or continuous.

2.	Draw a histogram and a boxplot displaying the distribution of brain weight. 

3.	Based on the shape of the distribution of brain weight, determine and calculate the appropriate measures of the center and spread of the data.

4.	Draw conclusions about the weight of a typical adult human brain.  
