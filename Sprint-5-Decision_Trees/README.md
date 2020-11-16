# Sprint 5 &ndash; Decision Trees and Neural Networks

<img src="https://imgs.xkcd.com/comics/trained_a_neural_net_2x.png" width="30%" />

## Starts Wednesday, 11/11
## Deliverables and quiz are due on Wednesday, 12/2

## Overview and Goals

Our main goal for this unit is to study two more important classification techniques: **decision trees** and **neural networks**.

A decision tree is a hierarchical flowchart where the leaves at the bottom of the tree represent classiication decisions. Using a decision tree to classify an item is
straightforward: start at the top of the tree and work your way down, following the appropriate branch at each level based upon the features of the item under consideration.

<img src="https://upload.wikimedia.org/wikipedia/commons/e/eb/Decision_Tree.jpg" width="50%" />

>*Example decision tree for the Titanic data set. The numbers in each leaf node are the probability of survival and the total fraction of the data set associated with that >outcome. 73% of women survived accounting for 36% of passengers. Men over the age of 9.5 were 61% of all passengers but had only a 17% survival rate.*

We're going to be interested in **building** decision trees from data. This is a supervised learning problem: given a set of labeled training examples, we'd like to 
construct the best possible decision tree for classifying them. This turns out to be an interesting problem, and along the way we'll get to learn a little bit of
information theory to explain why some trees are better than others.

Once we know how to build individual decision trees, we can use the powered-up version of decision tree learning: **random forests**, which creates a set of multiple
decision trees and combines their outputs to produce more robust classiication decisions.

**Neural networks** are one of the most important categories of modern machine learning algorithms. They are **very loosely** inspired by biological neurons, but it turns out
that they can be extremely flexible and powerful learning models. Many of the advances that we've seen in the last decade in areas like image classification and game playing
have been driven by the new "**deep learning**" neural network architectures.

<img src="https://www.researchgate.net/profile/Facundo_Bre/publication/321259051/figure/fig1/AS:614329250496529@1523478915726/Artificial-neural-network-architecture-ANN-i-h-1-h-2-h-n-o.png" width="50%" />


Designing and training neural nets is a huge subject and really worthy of a class on its own. We're going to focus on two important models:

- The **perceptron**, which is the building block for more complex models. By itself, it's a simple linear classifier. We want to understand how the individual perceptron
implements a linear classifier and how to train one from data.

- The **multi-layer perceptron**, which is what most people mean when they use the term "artificial neural network". A MLP is a nonlinear classifer built from a collection of 
individual perceptrons. They almost always have a layered stucture, with an "input" layer, an "output" layer, and one or more "hidden" layers in between.


## A Note on the Deliverables for this Unit

You have only one project to solve for this unit. It's intentionally more open than some of our previous projects, but not that difficult. This is intentional so that you have 
some time to make progress on the Challenge Projects if you so choose.


## Reading

Complete the **participation questions** for Chapter 11 of the Zybook on Decision Trees. The ZyBook does not have a chapter on neural networks.

## Deliverables and Quiz

Complete the problems in `Deliverables`. Remember that you may work freely with the members of your team and you may use any resources that you find helpful to
complete the project. **Please list the names of you collaborators in the project document**.

The quiz and reflective write-up will be done **online** on **Wednesday, December 2**, which will also be the release day for the next sprint's material. The quiz will be 
**individual** (not team) but will be **open everything**: you can use the sprint resources, your notes, and online resources. Remember to abide by the Honor Code 
and ask me if you have questions about what is an acceptable resource!

**Remember that you have only two weeks to complete this sprint, so don't procrastinate!**

## Submission Instructions

Upload one document (Word or PDF) containing all of your answers to the sprint questions. Please remember to include:

- Answers to every part of every question.

- Your code.

- Any plots that you need to create to answer each question.


## Resources

We'll mostly be working through material in class. In addition to the ZyBook, the main resource you'll want to look at are the notes from *Introduction to Data Mining* [link](https://www-users.cs.umn.edu/~kumar001/dmbook/index.php). Take a look at the text and slides for Chapter 3 on Decision Trees and the slides for Chapter 4 on neural networks.
These chapters contain a lot of material, so don't get bogged down in trying to understand every detail the first time you read them. In particular, you can lightly glide over
the derivations that require Calculus; we'll talk about the important concepts in class.

For visualizing the concepts behind neural networks, I really like [this video](https://www.youtube.com/watch?v=aircAruvnKk) and the [Tensorflow Playground](https://playground.tensorflow.org/).

