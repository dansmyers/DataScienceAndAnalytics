# Challenge Project &ndash; Neural Networks

## Due December 11 (one week before the end of classes)

## Description

This project will give you an opportunity to practice using and training neural networks, including writing some code in R with the `neuralnet` package.



## Submission

Put all of your answers in one document, including calculations, figures, code, and any graphics that you generate as part of your solutions. Upload your document to the
assignment I'll create on Canvas before the delivery date.


## Questions

### Perceptron Training

Consider the NAND ("NOT-AND") function, shown below. It's the inverse of the regular `AND` function: it evaluates to `TRUE` when both inputs are 0 and `TRUE` otherwise.

```
   ^
   |
1 ---   F                 F 
   |
   |
   |
   |
   |
   |
0 ---   T                 F
   |
   -----|-----------------|----->
        0                 1
```

Train a **simple linear perceptron** to correctly classify the NAND function. You can assume that the points marked `F` in the diagram above have a correct class value of -1
and the point marked `T` has a class value of 1.

```
NAND function data set

x_1    x_2   |    output
---------------------------
 0      0    |       1
 0      1    |      -1
 1      0    |      -1
 1      1    |      -1
```

Use the following parameters for the perceptron initialization:

```
w_1 = .5  (weight for input x_1)
w_2 = .5  (weight for input x_2)

w_0 = 0   (constant input)
```


### Training a Neural Net

We looked at a simple example of training and prediction using the `neuralnet` package in class.

For the second part of this project, work through [this tutorial](https://datascienceplus.com/fitting-neural-network-in-r/), which will show you a non-trivial example of training and evaluating a neural network model
to predict housing prices. It includes:

- Pre-processing the data to prepare it for the neural network
- Splitting the data intro training and testing sets
- Choosing parameters
- Visualizing the trainined network
- Comparing the trained network to a simple linear model
- An illustration of the cross-validation technique for evaluating model performance (this is nice to know about)


Include the code you write and the model outputs and the plots in your document.

Note: you don't have to write any original code for this project, since everything you need is given in the tutorial. **I do want you to work throught the document one
step at a time and write the code by hand**; you won't learn anything if you just copy and paste the finished code, so don't do that.
