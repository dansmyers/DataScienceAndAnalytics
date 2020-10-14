# Sprint 3 &ndash; Regression

<img src="https://imgs.xkcd.com/comics/extrapolating.png" width="50%" />

## Starts Wednesday, 10/14
## Deliverables and quiz are due on Wednesday, 10/28

## Overview and Goals

This sprint will be a transition between traditional statistics content and the topics of machine learning and predictive modeling that we'll focus on in the second half
of the course.

We're going to focus on three things:

- Revisiting the important concept of **regression**, with an emphasis on understanding the derivation of simple linear regression and the least squares approach.

- Learning some linear algebra, which will come in handy when we talk about other kinds of models in the future.

- Principal components analysis, which is an important application of linear algebra to data modeling.

## Reading

Complete the **participation questions** for Chapter 6 of the Zybook.

## Deliverables and Quiz

Complete the problems in `Deliverables`. Remember that you may work freely with the members of your team and you may use any resources that you find helpful to
complete the project. **Please list the names of you collaborators in the project document**.

The quiz and reflective write-up will be done **online** on **Wednesday, October 28**, which will also be the release day for the next sprint's material. The quiz will be 
**individual** (not team) but will be **open everything**: you can use the sprint resources, your notes, and online resources. Remember to abide by the Honor Code 
and ask me if you have questions about what is an acceptable resource!

**Remember that you have only two weeks to complete this sprint, so don't procrastinate!**

## Submission Instructions

Upload one document (Word or PDF) containing all of your answers to the sprint questions. Please remember to include:

- Answers to every part of every question.

- Your code.

- Any plots that you need to create to answer each question.


## What You Need to Learn

- The concept of **simple linear regression** and the **derivation** of linear regression by minimizing the sum of the squares of the residuals (the full derivation requires a
little bit of calculus, which I won't require you to do on the quiz).

- **Performing regression modeling in R**, including follow-on analyses like visualizing the residuals.

- The **correlation coefficient, *r***, and it's interpretation.

- **Vectors**: visualizing, adding, and multiplying vectors.

- Calculating the **dot product** of two vectors and interpreting it as a measure of similarity.

- **Matrices**: basic terminology, adding, transposing, matrix-vector products, matrix-matrix products.

- **Matrix inverses**.

- Interpreting a matrix-vector product as a **transformation** of the vector.

- Calculating the special matrix *X*<sup>T</sup>*X* and interpreting it as being related to the covariance matrix.

- **Principal components analysis**, which requires tying together all of the earlier topics in this unit.


## Resources

## Linear Regression

As before, there is a chapter in the `Examples` directory illustrating how to carry out a regression study in R using a real data set as an example.

[This article](https://towardsdatascience.com/linear-regression-derivation-d362ea3884c2) works through the math of deriving simple linear regression. [This video](https://www.youtube.com/watch?v=ewnc1cXJmGA) covers similar territory.


## Matrix Algebra


[These videos](https://www.youtube.com/playlist?list=PLZHQObOWTQDPD3MizzM2xVFitgF8hE_ab) are high-quality overviews of the most important concept of linear algebra. The first 
three, covering vectors, linear combinations, and matrices, are the most important for this unit. If you want to go deeper, check out the later videos on the dot product and
eigenvalues and eigenvectors, which have an important connection to principal components analysis that we'll touch on briefly.

### PCA

[This article](https://towardsdatascience.com/a-one-stop-shop-for-principal-component-analysis-5582fb7e0a9c) gives a reasonably concise and intuition focused overview of
principle components analysis.

The [setosa.io app](https://setosa.io/ev/principal-component-analysis/) illustrating PCA.
