<!-- RATING: Hard -->
<!-- NAME: Battleship -->
<!-- GENERATOR: generator.pl -->
# Battleship

Ever played drinking battleship? You're about to.

So, let's go on the offensive now.

It's the last move. You've only got one last shot to make, so make it count. If your program is smart, it should be able to pick out the winning move pretty quick. We'll help out and give you several options. You must pick the right one.

It's more complicated than you might think though, so be prepared to drink. In the event there are two or more choices that could theoretically win the game, you must pick the right one. Remember, this emulates what you would see while playing battleship, so just because your answer satisfies a potential layout of the board does not mean it reflects the actual layout.

For this problem, there are 5 boats. The boats have length 2,3,4,5 and 6.  respectively.

## INPUT
The input will consist of a series of 11X11 grid of characters. The top line of each board indicates the column name, the far left line indicates the row name. X indicates a previous hit that has been guessed, while a '.' character indicates an unknown value. A 'O' indicates a possible move. Each board will be separated by a \#

## The Output
Print a coordinate value for the possible move (marked with a 'O') that will win the game. Your output is in the form of an uppercase letter followed by a number. 

## Sample input
	 ABCDEFGHIJ
	0..........
	1.XO.......
	2XXXXXOXX..
	3XX........
	4......O...
	5..........
	6...OXXXX..
	7.XXXXX....
	8..O.......
	9..........
	#


## Sample output
	F2

