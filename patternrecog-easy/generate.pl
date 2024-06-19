#!/usr/bin/perl


($problem_file, $solution_file) = @ARGV;
open(INFILE,">$problem_file");
open(OUTFILE,">$solution_file");

my $count = int(rand(20))+10;

for ($n = 0 ; $n < $count ; $n++)
{
	my $start = int(rand(100));
	my $cnt = int(rand(5)) + 5;
	my $diff = int(rand(100));
	my $val = $start;
	my $string = "";
	my @seq = ();
	for(my $x = 0; $x < $cnt; $x++){
		push(@seq,$val);
		$val += $diff;
	}
	my $string = join(" ", @seq);	
	print INFILE "$string\n";
	print OUTFILE "$val\n";
}

