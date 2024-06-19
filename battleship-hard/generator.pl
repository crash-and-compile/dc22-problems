#!/usr/bin/perl

($problem_file, $solution_file) = @ARGV;
open(INFILE,">$problem_file");
open(OUTFILE,">$solution_file");


for (0..50+int(rand(10))) {

#0..........
#1.XX.......
#2.....XX.X.
#3..........
#4...X......
#5...X...X..
#6...X...X..
#7.......X..
#8..X....X..
#9.......X..
my @board = ();
for(my $i = 0; $i < 11; $i++){
	for(my $j = 0; $j < 11; $j++){
		$board[$i][$j] = ".";
	}
}
#for(my $i = 0; $i < 11; $i++){
#	for(my $j = 0; $j < 11; $j++){
#		my $ran = int(rand(100));
#		if(($ran % 2) == 1){ $board[$i][$j] = "."; }
#	}
#}
$board[0][1] = 'A';
$board[0][2] = 'B';
$board[0][3] = 'C';
$board[0][4] = 'D';
$board[0][5] = 'E';
$board[0][6] = 'F';
$board[0][7] = 'G';
$board[0][8] = 'H';
$board[0][9] = 'I';
$board[0][10] = 'J';
$board[1][0] = '0';
$board[2][0] = '1';
$board[3][0] = '2';
$board[4][0] = '3';
$board[5][0] = '4';
$board[6][0] = '5';
$board[7][0] = '6';
$board[8][0] = '7';
$board[9][0] = '8';
$board[10][0] = '9';

$board[0][0] = ' ';


for(my $s = 2; $s <= 6; $s++){
	my $done = 0;
	while($done == 0){
		my $dir = int(rand(100)) % 2;
		if($dir){
			#print "VERTICAL SIZE $s\n";
			my $minrow = 1;
			my $maxrow = 10 - $s;
			#print "MINROW = $minrow\n";
			#print "MAXROW = $maxrow\n";
			my $basex = int(rand($maxrow - 1)) + 1;
			my $basey = int(rand(9)) + 1;
			my $exists = 0;
			for(my $row = $basex; $row < ($basex + $s); $row++){
				if(($board[$row][$basey] eq "X")||($board[$row][$basey] =~ /\d/)){
					$exists++;
					#print "COLISSION!\n";
				}
			}
			if($exists > 0){ next; }
			for(my $row = $basex; $row < ($basex + $s); $row++){
				#print "[$row][$basey]\n";
				$board[$row][$basey] = "X";
			}
			#for(my $i = 0; $i < 11; $i++){
			#	for(my $j = 0; $j < 11; $j++){
			#		print $board[$i][$j];
			#	}
			#	print "\n";
			#}
			#<STDIN>;
		} else {
			#print "HORIZONTAL SIZE $s\n";
			my $mincol = 1;
			my $maxcol = 10 - $s;
			#print "MINCOL = $mincol\n";
			#print "MAXCOL = $maxcol\n";
			my $basex = int(rand(9)) + 1;
			my $basey = int(rand($maxcol - 1)) + 1;
			my $exists = 0;
			for(my $col = $basey; $col < ($basey + $s); $col++){
				if(($board[$basex][$col] eq "X")||($board[$basex][$col] =~ /\d/)){
					$exists++;
					#print "COLISSION!\n";
				}
			}
			if($exists > 0){ next; }
			for(my $col = $basey; $col < ($basey + $s); $col++){
				#print "[$basex][$col]\n";
				$board[$basex][$col] = "X";
			}
			#for(my $i = 0; $i < 11; $i++){
			#	for(my $j = 0; $j < 11; $j++){
			#		print $board[$i][$j];
			#	}
			#	print "\n";
			#}
			#<STDIN>;
		}
		$done = 1;
	}
}
my $picked = 0;
my $x = "";
my $y = "";
my %yref = qw(
1	A
2	B
3	C
4	D
5	E
6	F
7	G
8	H
9	I
10	J
);
my %xref = qw(
1	0
2	1
3	2
4	3
5	4
6	5
7	6
8	7
9	8
10	9
);
my $avoidx = "";
my $avoidy = "";
while($picked == 0){
	$x = int(rand(10));
	$y = int(rand(10));
	if($x == 0){ next; }
	if($y == 0){ next; }
	if(($board[$x][$y] eq "X")||($board[$x][$y] =~ /\d/)){
		$board[$x][$y] = "O";
		$avoidx = $x;
		$avoidy = $y;
		$picked = 1;
	}
}
my $xp = $xref{$x};
my $yp = $yref{$y};
while($picked < 5){
	$x = int(rand(10));
	$y = int(rand(10));
	if($x == 0){ next; }
	if($y == 0){ next; }
	if($x == $avoidx){ next; }
	if($y == $avoidy){ next; }
	if(($board[$x][$y] eq ".")){
		$board[$x][$y] = "O";
		$picked++;
	}
}
for(my $i = 0; $i < 11; $i++){
	for(my $j = 0; $j < 11; $j++){
		print INFILE $board[$i][$j];
	}
	print INFILE "\n";
}
print INFILE "#\n";

print OUTFILE "$yp$xp\n";

}
