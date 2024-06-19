#!/usr/bin/perl


($problem_file, $solution_file) = @ARGV;
open(INFILE,">$problem_file");
open(OUTFILE,">$solution_file");

my @boardall = qw(
..........
.XX.......
.....XXXX.
..........
...X......
...X...X..
...X...X..
.......X..
..X....X..
.......X..
);
my @board = ();
for(my $i = 0; $i < 10; $i++){
	my @row = split(//,$boardall[$i]);
	for(my $j = 0; $j < 10; $j++){
		$board[$j][$i] = $row[$j];
	}
}
for(my $i = 0; $i < 10; $i++){
	for(my $j = 0; $j < 10; $j++){
		#print "[$board[$j][$i]]";
	}
	#print "\n";
}
my %colval = qw(
0	A
1	B
2	C
3	D
4	E
5	F
6	G
7	H
8	I
9	J
);

my $total = int(rand(30))+15;

for(my $count = 0; $count < $total; $count++){
	my $rowg = int(rand(10));
	my $colg = int(rand(10));
	my $colvalref = $colval{$colg};
	my $res = "";
	for(my $row = 0; $row < 10; $row++){
		for(my $col = 0; $col < 10; $col++){
			#print "$col/$colg\n";
			if(($row == $rowg)&&($col == $colg)){
				if($board[$col][$row] eq "X"){
					#print "[H]";
					$res = "HIT";
				} else {
					#print "[M]";
					$res = "MISS";
				}
			} else {
				#print "[$board[$col][$row]]";
			}
	 	}
		#print "\n";
	}
	print INFILE "$colvalref$rowg\n";
	print OUTFILE "$res\n";
}
#print "$colvalref$rowg = $res\n";

close(INFILE);
close(OUTFILE);
