<!-- RATING: HARD -->
<!-- NAME: WUMPUS HARD -->
<!-- GENERATOR: generate.pl -->
##Hunt the Wumpus

<font color=blue>Difficulty: Hard</font>

Ahhh, the classic Wumpus world. Treasure, dangerous mythical beasts, and artificial intelligence.

Can you follow directions?

##INPUT
- Each input file will contain one or more games.
- Each input file will contain a 10X10 grid of characters. 
- This grid will indicate your starting location as an S, the location of a treasure as a T, and the location of an adventurer devouring beast as a B. 
- All other spaces will be represented by a _ character. 
- All lines after the grid will indicate two sets of directions seperated by a space. Directions are N, E, S, or W.
- At the end of each game the word END will be on a line by itself.
- The first direction is for your character, the second is for the wumpus.
- We are only interested in the final location after both you and the wumpus move. Passing the wumpus in transit does not result in death, but ending up in the same room after both of you have moved does.
- Sorry, if both you and the wumpus reach the treasure, you die.
- If at ANY point you enter the grid location with the treasure, you win.
- At the end of each game, your job is to print out if you have found: TREASURE, DEATH, or NOTHING.
- In classic RPG style, if you or the wumpus go off the grid in one direction, you end up back on the grid on the other side. 
So go N from the top of the grid, and you will be at the bottom of the grid.

##The Output
Print out either TREASURE, DEATH, or NOTHING

##Sample Input
	__T_______
	__________
	__B_______
	__________
	S_________
	__________
	__________
	__________
	__________
	__________
	S W
	N W
	E W
	E S
	E W
	E E
	W N
	E N
	N W
	E W
	N E
	W N
	E W
	E E
	E S
	S N
	E N
	S N
	S S
	N W
	E W
	W E
	W E
	N W
	N S
	N S
	E S
	S W
	W S
	S S
	S N
	E E
	E N
	S E
	N N
	W W
	E W
	E S
	W W
	W N
	E S
	E N
	E N
	END

## Sample Output
	DEATH
