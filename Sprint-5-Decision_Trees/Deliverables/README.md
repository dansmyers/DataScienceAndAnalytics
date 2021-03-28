# Sprint 5 Deliverable &ndash; The Disputed Federalist Papers

<img src="https://images-na.ssl-images-amazon.com/images/I/71wcAwRBSCL.jpg" width="30%" />

## Description

*The Federalist Papers* are a collection of essays written by Alexander Hamilton, James Madison, and John Jay, first published as newspaper articles in 1787 and 1788 and then later collected into book form. Originally written to encourage the people of New York to ratify the new U.S. Constitution, the *Papers* are considered to be classics of political science, providing essential insight into the Founding Fathers' views on government.

The text of the U.S. Constitution was approved by its Framers in Philadelphia in September 1787, but the document required the approval of 9 of the 13 states before it would take effect. Public attitudes toward the Constitution were initially uncertain and the new plan was immediately attacked by "Anti-Federalist" essays appearing in newspapers, criticizing its expansion of federal power. Most of these opposing authors wrote under pseudonyms taken from classical history, such as "Cato" and "Brutus".

Over the fall of 1787 and spring of 1788, Hamilton, Madison and Jay wrote 77 short essays that appeared in New York papers, answering Anti-Federalist criticisms and outlining their views on government and the meaning of the new Constitution. These papers, plus eight more on similar topics, were collected and published as a book in 1788. All of the 85 essays were originally printed under the pseudonym "Publius", a reference to one of the founders of the Roman Republic. The true authors' names do not appear in the original papers.

Shortly before his 1804 death [in a duel with Aaron Burr](https://www.youtube.com/watch?v=0Gkqzxss8Ss), Hamilton wrote a list that claimed authorship of 63 of the 85 papers. In 1818, after finishing his service as the fourth President, Madison released his own authorship list, which overlapped partly with Hamilton's.

<img src="https://i.pinimg.com/originals/a7/38/58/a73858b9662f70529fc8bc817baedabc.jpg" width="20%" />

Hamilton is acknowledged as the undisputed sole author of 51 papers, with Madison as the sole author of 14. Jay is credited with five. Three of the articles are known to be collaborations between Madison and Hamilton, leaving the remaining 12 "disputed" papers that might have been written by Hamilton or Madison.

In this project, you'll re-create a study by Glenn Fung (see reference 1) that used machine learning to predict the authorship of the disputed *Federalist Papers*. You will be able to practice a complete machine learning project study, including extracting the feature vetors, developing a model, and writing up your results.

## Text Analysis

Different writers use language in different ways. Therefore, textual critics may resolve questions of authorship by examining how the words, style, and structure of a disputed passage compares to other known works by its potential authors.

In 1998, Robert Bosch and James Smith used **word counts** to distinguish between Madison and Hamilton's papers (see reference 2). They identified a set of 70 basic **function words** that are useful for textual analysis and counted their occurrences in each of *The Federalist Papers*. They then used these 70-element vectors to build a model that could classify Hamilton and Madison's known papers correctly. Fung's study used the same data with a machine learning technique called a **support-vector machine** (SVM), a variation of the linear classifier we studied earlier in the class.

### The Results

Bosch, Smith, and Fung attributed all of the 12 disputed papers to Madison. This agrees with the opinions of other scholars, although there are arguments that some of the essays attributed to Madison may have been collaborative efforts.

## The Data

The file `Federalist.xlsx` (uploaded to Canvas) contains the data for the project. This is the original data created by Bosch and Smith and also used by Fung, which I obtained from a previous project at UW-Madison. I have also uploaded a comma-separated-value (csv) version of the data to this repo for safekeeping.

The file has 118 lines, corresponding to 118 text excerpts. The first entry on each line is the class of the text excerpt:

- 1 for Hamilton's papers
- 2 for Madison's papers
- 3 for disputed papers

The remaining 70 values are the frequency of occurrence of the 70 function words in the text, scaled to units of estimated occurrences per 1000 words.

## What You Need to Do

This project is not that difficult, but will require you to carry out all parts of the study from scratch. Previous examples that we've done in class may be helpful.

1. Load the data set into R Studio.

2. Use `subset` to separate the training and testing sets based on class label. The testing set, which is the disputed papers, has `Federalist$class == 3`.

3. Construct a decision tree model using `rpart` and visualize it. What does the model say about distinguishing between the two authors?

4. Use the model to classify the 12 test instances. What results do you obtain?

Finally, write up the results of your analysis in a **short** report. Your report should have the following sections:

- **Introduction** - summarize the problem (one or two paragraphs)

- **Methods** - summarize the data and the analysis technique that you are using

- **Results** - show a plot of the resulting decision tree and describe your results on the test set

- **Conclusion** - restate the purpose of your study, your methods, and what you learned (one paragraph).

- **Appendix** - include your code here

Upload your short paper to Canvas. Your analysis should include all of the parts above and be written in a professional technical style. That means,

- No obvious spelling or grammar errors.

- Detached, impartial assessment of results. Avoid using superlative words or adverbs like "extremely".

- Provide details. Don't just tell what you learned in general terms, describe the specifics of the model (what functions did you use, with what parameters, etc.) For 
example, how many examples and features are in the data set? How many training examples for each author do we have? What splitting criterion was used to construct the decision tree? What complexity parameter values did you use? If you used a pruning strategy what was it? (Note that you may not need to prune anything). **Try to be as specific
as possible and don't worry about providing too much detail**.

## References

Fung, G. (2003, October). The disputed Federalist Papers: SVM feature selection via concave minimization. In Proceedings of the 2003 Conference on Diversity in Computing (pp. 42-46). ACM.

Bosch, R. A., & Smith, J. A. (1998). Separating hyperplanes and the authorship of the disputed federalist papers. The American mathematical monthly, 105(7), 601-608.
