<!-- RATING: Medium -->
<!-- NAME: Questions -->
<!-- GENERATOR: generate.pl -->
# Questions

Did you see that Jeopardy match where Watson kicked everyones butt? Let's see if you can do something similar. You'll write a program that can answer intelligently.

Let's get a little more complicated. We will build a valid question from some tokens. 

First we define a valid questions as meeting the following criteria:

1) Ends in a question mark.
2) Starts with a capital letter.
3) Contains at least 2 alphabetic characters

A token is a set of consecutive characters. Basically, think "words". 

The first part of a valid question must start with one of these tokens:
Is
Are

The second token can be anything

The next consecutive tokens must be either:
the same as
not the same as
different from


## INPUT
The input will consist of a series of alphabetic and special characters and spaces.

## The Output
Print YES or NO, depending on if the sentence has a valid structure for a question according to our definition.

## Sample input
	Is ghsdhsdh the same as asdf?

## Sample output
	YES
