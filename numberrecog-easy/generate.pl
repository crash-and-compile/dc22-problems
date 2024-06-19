#!/usr/bin/perl

($problem_file, $solution_file) = @ARGV;
open(INFILE,">$problem_file");
open(OUTFILE,">$solution_file");

my $count = int(rand(100))+100;

my $inputdata = "";
my $outputdata = "";

for(my $y = 0; $y < $count;$y++){

	my $tokens = int(rand(9))+1;
	my $total = 0;
	my $string = "";
	for(my $x = 0; $x < $tokens;$x++){
		my $either = int(rand(100));
		if(($either % 2) == 0){
			my $cnt = int(rand(5))+1;
			$total += $cnt;
			$string .= "1"x$cnt;
		} else {
			my $cnt = int(rand(5))+1;
			$string .= "l"x$cnt;
		}
	}
	$inputdata .= "$string\n";
	$outputdata .= "$total\n";
}

print INFILE "$inputdata";
print OUTFILE "$outputdata";

