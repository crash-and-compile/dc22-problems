<!-- RATING: Medium -->
<!-- NAME: Number Recognition -->
<!-- GENERATOR: generate.pl -->
# Number Recognition

Let's see if you can handle a simple CAPTCHA problem. I'll give you a challenge, 
you tell me the number I'm looking for.

I will give you a 10x10 matrix of 1's and l's. Tell me how many consecutive lines
of two or more 1's there are. A consecutive line may go vertically or horizontally, but not
diagonally.  For example:

	11111111 would be a horizontal line

	1
	1 would be a vertical line
	1
	1

The consecutive lines of 1's might not take up the entire row/column, so check your bounds.

## INPUT
The input will consist of grids consisting of variable number of lines and characters, either 1 or l.
Each grid will be separated by a \#

## The Output
Print the number of lines of consecutive horizontal or vertical 1's in each matrix.

## Sample input
	llllllllll
	llllllllll
	l111111111
	lllll1llll
	ll1111111l
	lllll1llll
	111111111l
	lllll1llll
	lllll1llll
	llllllllll

## Sample output
	4

