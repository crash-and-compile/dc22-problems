#!/usr/bin/perl


($problem_file, $solution_file) = @ARGV;
open(INFILE,">$problem_file");
open(OUTFILE,">$solution_file");


my $total = int(rand(50))+20;
for($count ; $count < $total ; $count++)
{
	my $cnt = int(rand(5)) + 5;
	my $x = int(rand(100));
	my $y = int(rand(100));
	my $init_x = $x;
	my $init_y = $y;
	my $val = 2 * $x + $y;
	my $string = "";
	my @seq = ();
	for(my $i = 0; $i < $cnt; $i++){
		push(@seq,$val);
		$x = $val;
		$val = 2 * $x + $y;
	}
	my $string = join(" ", @seq);
	print INFILE "$string\n";
	print OUTFILE "$init_x $init_y\n";
}

close(INFILE);
close(OUTFILE);

