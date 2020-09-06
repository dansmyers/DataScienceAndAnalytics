# Lab #1 &ndash; Working with R and RStudio

## Overview

## Installing R and RStudio

The first step in using RStudio is to download it and install it on your personal computer. R and RStudio are free to use and easy to install on Mac and Windows computers. It’s a bit more complicated to install the software on a Linux or Unix machine, so if you use one of those operating systems and don’t feel comfortable doing the installation yourself, we recommend contacting a systems administrator to guide you through the process.  

Note that, while this book focuses on using RStudio, the R software must be installed before RStudio for RStudio to work. 

To install R on Windows:

1.	Open “http://www.r-project.org” in your browser.
2.	Click on “download R” in the paragraph under “Getting Started”. You’ll see a list of mirror sites organized by country.
3.	Click on “https://cloud.r-project.org/” under the heading “0-Cloud”.  
4.	Click on “Download R for Windows” under the heading “Download and Install R”.
5.	Click on “base”.
6.	Click on the link for downloading the latest version of R.
7.	When the download completes, double-click on the .exe file and follow the prompts.

To install R on OS X:

1.	 Open “http://www.r-project.org” in your browser.
2.	Click on “download R” in the paragraph under “Getting Started”. You’ll see a list of mirror sites organized by country.
3.	Click on “https://cloud.r-project.org/” under the heading “0-Cloud”.  
4.	Click on “Download R for (Mac) OS X” under the heading “Download and Install R”.
5.	Click on the .pkg file for the most recent version of R under “Latest Release”.
6.	Click on the link for downloading the latest version of R.
7.	When the download completes, double-click on the .pkg file and follow the prompts.

Once you have R installed on your computer, you must install RStudio.

1.	Open “https://www.rstudio.com/” in your browser.
2.	Click on “Download”.
3.	Click on “Download” under “RStudio Desktop Open Source License”.
4.	Click on the appropriate (Mac or Windows) file under “Installers” to download RStudio.
5.	When the download completes, double-click on the file and follow the prompts.

Once RStudio is installed, you can open it just as you would any other application.  

## The *Titanic* Dataset

In the early hours of April 15, 1912, the "unsinkable" ship RMS *Titanic* sank when it struck an iceberg, killing more than half of the passengers and crew aboard. The `Titanic.xlsx` dataset (posted to Canvas) 
contains demographic information for 889 of those passengers as well as a record of whether or not each passenger survived. Our goal is to explore the functionality of RStudio by opening
and modifying the *Titanic* dataset.

### Project deliverables

1.	Understand the function of the RStudio Console.
2.	Import the Titanic.xlsx dataset into RStudio.
3.	Use the data dictionary to identify the variables in the dataset.
4.	Open and save a new R Script.
5.	Create a new variable called Titanic$Sex.num that takes on the value 0 if a passenger is female and 1 if a passenger is male.
6.	Create a subset of the Titanic dataset called Titanic.Firstclass that includes only first class passengers.
7.	Create a subset of the Titanic dataset called Titanic.Children that includes only passengers under the age of 18.
8.	Save, close and re-open an R script.

### Deliverable 1: Understand the function of the RStudio Console.

When you open RStudio for the first time, you’ll see a screen with three panels. One panel called the Console runs vertically down the left side of the application. There is some text that is preloaded into the Console, and under that text you’ll see a > symbol. This is where commands are executed. Click in the window next to the >, type 2+2 and hit the enter/return key (depending on if you are using a PC or Mac). The result should appear in the Console as

```
> 2+2
[1] 4
```

RStudio can do many calculations in the Console; however, more often, we want open a dataset that has already been created. In this text, we will focus on opening data stored as an Excel (.xlsx) file. You will need to download each dataset used in the Guided and Student Projects and save them on your computer where you can find the files easily.

### Deliverable 2: Import the `Titanic.xlsx` dataset into RStudio

The easiest way to import a file into RStudio is by selecting “File” and then “Import Dataset” from the main menu. When you hover your mouse over “Import Dataset”, another menu will appear and allow you to select the type of file you would like to import. In this case, we will choose “From Excel…”, but note that you can read in data saved as a text or .csv file or a SAS, Stata or SPSS (which are other statistical software) file, and the process will be largely the same.

Click the “Browse” button to the right of the text box under “File/Url:” and navigate to where you saved the Titanic.xlsx file. Click on Titanic.xlsx and “Open” to begin the process of importing the dataset into RStudio. It will take a few seconds, but if the import worked correctly, the panel labeled “Data Preview” will be populated with the column names and the first several rows of data from the Excel file. It sould look very much like the original Excel spreadsheet.

Note the panel labeled “Code Preview” at the bottom left. This panel contains the code RStudio will automatically paste in the Console to import that data after you click the “Import” button.  

Click “Import”. You will return to the original screen, but note that several things have changed. First, the left pane of the screen has now split in two with a spreadsheet view of the Titanic dataset at the top and the Console on the bottom. The commands in the Console now read

```
> library(readxl)
> Titanic <- read_excel(“~[Your directory path]/Titanic.xlsx") 
> View(Titanic)
```

The `> View(Titanic)` command inserted automatically by RStudio is what prompted the spreadsheet to appear above the Console.

On the upper right hand side of the screen under “Environment”, there is a list of datasets that have been created or uploaded during the session. Now `Titanic` appears in that list as well as details about the number of observations and variables in the dataset. Double clicking on Titanic under “Environment” has the same effect as entering View(Titanic) in the Console.  

If you import additional datasets, they will also be listed under “Environment”.

### Deliverable 3: Use the data dictionary to identify the variables in the dataset and the meaning of any codes used for variables.

Data sets often contain abbreviations for variables and use codes to represent different values of the variable. The data dictionary is where all of these abbreviations and codes are explained. You will save yourself time and heartache if you make it a habit to always consult the data dictionary as you explore your dataset. What seems intuitive often isn’t. There is a companion data dictionary for every dataset used in this text.

Open the file “Titanic Data Dictionary” posted to Canvas. We recommend saving it to your local directory in the same place you’ve saved the `Titanic.xlsx` dataset.

Each data dictionary used in this book has three columns. The first lists the variable name as it appears in the Excel file. The second gives a longer description of the variable. This is particularly helpful when the variable names are short. For example, it might not be obvious when you first open the Titanic dataset that Pclass refers to the passenger’s ticket class. The variable description gives you that information.  

Finally, the “Details” column tells you the values you can expect to see for each variable in the dataset. The first piece of information under "Details" tells you the data type of the variable: the "character" type is a sequence of one or more text characters, like a word or phrase, and the "numeric" type represents a decimal number. Then in brackets you see the values the variable can take on.  Some variables can only take on a few values. For example, Survived can either equal 0 or 1. Sex is either male or female. Pclass is equal to 1, 2 or 3. Some variables can take on an almost infinite number of values such as Name, which can be any string of characters. For numeric variables that are measurements, the brackets will identify the units of measure. For example, Age is measured in years and Fare is measured in £. 

After the brackets, there is additional information to help the user interpret what each value of the variable means. While Sex = male and Sex = female may seem clear from the context, Survived = 0 and Survived = 1 is not. We must consult the data dictionary to know that Survived = 0 means the passenger did not survive and Survived = 1 means he or she did. Many datasets use this 0 = No, 1 = Yes convention, but never take it for granted. Also, make sure you are very clear on what a variable represents. If the variable Survived had instead been named Perished, the 0 = No, 1 = Yes convention could still hold but would mean exactly the opposite! 

The first variable in the Titanic dataset is Survived. This variable indicates if the passenger survived the Titanic sinking or not. It is coded 0 if the passenger did not survive and 1 if the passenger survived. The second variable is Pclass. This identifies the passenger’s ticket class. It is coded 1 if the passenger was in first class, 2 if the passenger was in second class and 3 if the passenger was in third class. The third variable is Name, which records the name of each passenger as a character string. The fourth variable is Sex, wich identifies the passenger as male or female in a character string. The fifth variable is Age, which records the passenger’s age in years. The sixth variable is Siblings/Spouse_Aboard, which records the total number of individuals related to the passenger as a sibling or spouse who were also on board. The seventh variable is Parents/Children_Aboard, which records the total number of individuals related to the passenger as a parent or child who were also on board. Finally, the last variable is Fare, which records the amount paid (in  £) for the passenger’s ticket. 

### Deliverable 4: Open and save a new R Script.

In Deliverable 1 we learned that RStudio works by executing commands that are typed in the Console window. However, it’s important to know that nothing that you type in the Console will be saved when you close RStudio (even if you save your Workspace!). A better way to save and re-run R code is by writing an R Script. Scripts can be saved, re-opened and run over and over again.

To open a new script, select “File”, then “New File” and “R Script”. This will open a new tab in the window above the Console where we previously viewed the Titanic data set in spreadsheet form. Type 2+2 on line 1 and press enter. This time 2+2 is not executed, and the cursor just moves down to the next line. 

To run the code, highlight it with the mouse, and click “Run” in the menu bar of the tab. This will paste 2+2 in the Console and execute the code. The results should look exactly the same as when we entered 2+2 in the Console directly in Deliverable 1.

```
> 2+2
[1] 4
```

To save the R Script, click your cursor in the R Script tab. Select “File” then “Save As…” Navigate to the location where you want to save the R Script and name it. It will be saved as a .R file. You can continue to edit and re-save the script periodically as you would any other document.

### Deliverable 5: Create a new variable called `Titanic$Sex.num` that takes on the value 0 if a passenger is female and 1 if a passenger is male.

One of the most common data manipulations we’ll need to do is to create a new variable and add it to a dataset. In the Titanic dataset, `Sex` is recorded as male or female. However, it is sometimes more useful to represent data using a numeric code rather than a character string (or vice versa). Therefore, we’d like to create a new variable called Sex.num in the Titanic dataset that is coded as 0 if the passenger was female and 1 if the passenger was male.  

To do this, we will use the assignment symbol ( `<-` ) and the `ifelse` function. The assignment symbol assigns data to the new variable name. To create the `Sex.num` variable in the Titanic dataset, type the following in your R Script:

```
Titanic$Sex.num <- ifelse( 
    test = (Titanic$Sex == 'female'), 
    yes = 0, 
    no = 1
)   
```

The `$` between Titanic and Sex.num specifies that `Sex.num` is a variable that is to be created in the Titanic dataset. The assignment symbol assigns new data to `Sex.num` based on the results of the ifelse function. Note that dataset and variable names can’t have any spaces so we sometimes choose to use an underscore or period if we’d like to assign a name that has more than one word.

The `ifelse` function takes three input arguments named `test`, `yes`, and `no`. The values assigned to each of these three arguments control the behavior of the function: test is a logical expression that evaluates to true or false, yes is the value to return if the expression is true, and no is the value to return if the expression is false. Notice how the = symbol is used to assign values to the three arguments.

Within the `ifelse` function, we see the logical statement Sex == 'female'. In R syntax, the double equal sign means “is exactly equal to”. The ifelse function looks at the variable Sex for every passenger in the dataset. When Sex is female (the logical expression Sex == 'female' is true), then Titanic$Sex.num is assigned the value 0. When Sex is male (the logical expression Sex == 'female' is false), then Titanic$Sex.num is assigned the value 1.

Once you have typed the code for Titanic$Sex.num in your R Script, highlight all the rows and click “Run”. Then type and run View(Titanic) in your R Script to look at the updated spreadsheet view of the Titanic dataset. Check to see that the new Sex.num variable takes on the value 1 when the passenger is male and 0 when the passenger is female.

It is also good practice to add this variable to the data dictionary in case someone comes along after you and uses your dataset.

### Deliverable 6: Create a subset of the *Titanic* dataset called `Titanic.Firstclass` that includes only first class passengers.

A second helpful function when working with datasets is `subset`. The R command that will create a new dataset called `Titanic.Firstclass` is

```
Titanic.Firstclass <- subset(
    x = Titanic, 
    subset = (Titanic$Pclass == 1)
)
```

The subset function takes two input arguments called `x` and `subset`. Similar to the `ifelse` function, the values assigned to these two arguments control the behavior of the function: x is the complete dataset you wish to subset, and subset specifies which records you wish to include in the subset. In this case, we wish to subset the complete Titanic dataset and include records where the passenger class is exactly equal to 1 (Pclass == 1). 

Type the command to create the Titanic.Firstclass dataset in your R Script and run the code. Then type and run View(Titanic.Firstclass). The new data set will appear in spreadsheet view, and you can confirm that it only contains records from first class passengers. 

Deliverable 7: Create a subset of the Titanic dataset called Titanic.Children that includes only passengers under the age of 18.

Similarly, we can create a subset that only includes records for the children who were on board. The first entry in the subset function is still Titanic, but now we modify the subset = entry to read Titanic$Age < 18.  

Titanic.Children <-
subset(
        	x = Titanic, 
        	subset = (Titanic$Age < 18)
     	  )

In your R Script, type and run the code to create the Titanic.Children dataset. Note that both Titanic.Firstclass and Titanic.Children now appear under “Data” in the Environment window in the upper right panel of RStudio. Double click on each dataset name in that panel to see them appear in speadsheet view on the upper left.

Deliverable 8: Save, close and re-open an R script.

It would be cumbersome to have to go through the process of importing each dataset you want to work with each time you open RStudio. Fortunately, by using and saving R Scripts, you can preserve your work from session to session.

First, find the section of code that appeared in the Console when you imported the Titanic dataset. It will look something like this:

> library(readxl)
> Titanic <- read_excel(“~[Your directory path]/Titanic.xlsx") 
> View(Titanic)

Copy and paste those lines of code at the top of your R Script. Running this code when you open RStudio will allow you to import Titanic.xlsx without using menus like we did in Deliverable 2. Make sure to save your R Script 

When you close and re-open RStudio, it will, by default, reload your previous workspace (even if you didn’t save it!). This might strike some people as convenient and others as bizarre, but it is a feature we want to turn off so we can start with a blank slate every time we open RStudio. Otherwise it is easy to accidentally use an old version of a dataset or code, which could cause reproducibility errors. 

To disable this automatic reloading feature, select “Tools” and then “Global Options” from the main menu. Uncheck the boxes for “Restore most recently updated project at startup”, “Restore previously open source documents at startup”, “Restore .RData into workspace at startup”, and “Always save history (even when not saving .RData)”. Finally, in the drop down menu, change “Save workspace to .RData on Exit” to “Never.” Then click “Apply” and “OK”.

Now (after being sure to save your R Script!), quit RStudio by closing the application. Re-open RStudio and it should look just as it did when you opened it for the first time. Select, “File”, then “Open File” and select the R Script you wrote for this project. When the script opens, re-run the lines of code. The Titanic dataset will be reloaded, and any other functions you saved in the script (creating the Titanic.children and Titanic.Firstclass subsets, for example) will be generated

