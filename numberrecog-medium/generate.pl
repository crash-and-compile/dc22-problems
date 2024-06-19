#!/usr/bin/perl


($problem_file, $solution_file) = @ARGV;
open(INFILE,">$problem_file");
open(OUTFILE,">$solution_file");


$total = int(rand(10))+7;

for($count = 0 ; $count < $total ; $count++)
{
	my $board = ();
	my $x_size = int(rand(10))+20;
	my $y_size = int(rand(10))+20;

	my @board = ();
	for(my $x = 0; $x < $x_size; $x++){
		for(my $y = 0; $y < $y_size; $y++){
			$board[$x][$y] = "l";
			#print $board[$x][$y];
		}
		#print "\n";
	}
	my $lines = 0;
	for(my $x = 0; $x < $x_size; $x=$x+2){
		#print "Testing column $x...\n";
		my $yes = int(rand(100));
		if(($yes % 2) == 0){
			#print "Yup...\n";
			$lines++;
			my $topy = int(rand(100)) % 3;
			my $boty = $y_size - $topy - int(rand(100)) % 3;
			for(my $y = $topy; $y <= $boty; $y++){
				$board[$x][$y] = "1";
			}
		}
	}

	# randomly add vertical lines
	if(int(rand(10))>5)
	{
		for(my $y = 0; $y < $y_size; $y=$y+2){
			#print "Testing column $y...\n";
			my $yes = int(rand(100));
			if(($yes % 2) == 0){
				#print "Yup...\n";
				$lines++;
				my $topx = int(rand(100)) % 3;
				my $botx = $x_size - $topx - int(rand(100)) % 3;
				for(my $x = $topx; $x <= $botx; $x++){
					$board[$x][$y] = "1";
				}
			}
		}
	}

	my $board = "";

	# randomly flip
	if(int(rand(10))>5)
	{

		for(my $x = 0; $x < $x_size; $x++){
			for(my $y = 0; $y < $y_size; $y++){
				$board .= $board[$x][$y];
			}
			$board .= "\n";
		}
	}
	else
	{
		for(my $x = 0; $x < $y_size; $x++){
			for(my $y = 0; $y < $x_size; $y++){
				$board .= $board[$y][$x];
			}
			$board .= "\n";
		}
	}
	print INFILE "$board";
	print INFILE "#\n";
	print OUTFILE "$lines\n";
}

close(INFILE);
close(OUTFILE);

