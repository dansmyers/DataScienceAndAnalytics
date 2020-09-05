# Sprint 1 &ndash; Deliverables

## Submission

Put all of your answers in a well-organized Word document and upload it to the Sprint 1 Deliverable Assignment posted to Canvas.

Please include:

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

In the early hours of April 15, 1912, the "unsinkable" ship *RMS Titanic* sank when it struck an iceberg, killing more than half of the passengers and crew aboard.

The `Titanic.xlsx` dataset contains demographic information for 889 of those passengers as well as a record of whether or not that each passenger survived. Our goal is to describe the distributions of passenger ticket class and passenger survival.

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
