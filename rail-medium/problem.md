<!-- RATING: Medium -->
<!-- NAME: Rail -->
<!-- GENERATOR: railFenceGenerator.pl -->
# Ride the Rail

<font color=blue>Difficulty: Medium</font>

A Railfence cipher uses a "wave" sort of pattern (down, down, up, up, down, down, etc.)
to encode a string. For example, take the text "CODE IS COOL" and arrange to make a wave
like this (use&nbsp;_&nbsp;for&nbsp;spaces). The number of "rails" is the amplitude of these waves (for
example, we use a rail value of 3 in our example)

	C   _   C
	 O E I _ O L
	  D   S   O

Squish together the lines, and switch spaces in for the _ to get:

	C C
	OEI OL
	DSO

Then you just combine the lines and get the ciphertext: C COEI OLDSO

Simple enough. For this problem I'll give you a ciphertext. You give me the plaintext.
The ciphertext will only contain spaces and capital letters, but could use a rail value
between 3 and 15. All plaintext will contain the word PASSWORD in it. 

## INPUT
The input will consist of a single line of UPPERCASE characters and spaces

## The Output
Print the plaintext that was encrypted.

## Sample input
	C COEI OLDSO

## Sample output
	CODE IS COOL

