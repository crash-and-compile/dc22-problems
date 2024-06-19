<!-- RATING: Medium -->
<!-- NAME: Battleship -->
<!-- GENERATOR: generate.pl -->
# Battleship

Ever played drinking battleship? You're about to.

Let's start with the board. Here's what your setup looks like right now:

	 ABCDEFGHIJ
	0..........
	1.XO.......
	2.....XOOO.
	3..........
	4...X......
	5...O...O..
	6...X...O..
	7.......X..
	8..O....O..
	9.......X..

An X indicates that the boat is there and has been hit in that location, while an O indicates that the boat is there but has NOT been hit in that location yet.

If your opponent guesses B1, that would be a HIT, because the boat is there but the guess would not sink the ship. If your opponent guessed J0, that would be a MISS. If your opponent guesses C1, that is a SINK because the entirety of the boat will have been hit.

## INPUT
The input will consist of coordinate in the format of a letter and a number.

## The Output
For each line either the string HIT, the string MISS or the string SINK depending on whether the input coordinate has a ship in it.

## Sample input
	B1

## Sample output
	HIT

