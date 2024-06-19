#!/usr/bin/perl


($problem_file, $solution_file) = @ARGV;
open(INFILE,">$problem_file");
open(OUTFILE,">$solution_file");

for (0..int(rand(20))+10) {

my $start = int(rand(100));
my $cnt = int(rand(5)) + 5;
my $x = int(rand(100));
my $y = int(rand(100));
my $diff = 2*$x + $y;
my $val = $start;
my $string = "";
my @seq = ();
for(my $x = 0; $x < $cnt; $x++){
	push(@seq,$val);
	$val += $diff;
}
my $string = join(" ", @seq);	
print INFILE "$string\n";
#print OUTFILE "$val (2*$x + $y)\n";
print OUTFILE "$val\n";

}

