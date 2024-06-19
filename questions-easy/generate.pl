#!/usr/bin/perl
use Math::BaseCnv;

($problem_file, $solution_file) = @ARGV;
open(INFILE,">$problem_file");
open(OUTFILE,">$solution_file");

my @chars = ("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z");
my $cap = int(rand(100)) % 4;
my $min = int(rand(100)) % 4;
my $que = int(rand(100)) % 4;
my $string = "";
my $answer = "YES";
if($cap > 0){
	#print "CAP requirement met.\n";
	$string = uc $chars[int(rand(26))];
} else {
	#print "CAP requirement NOT met.\n";
	$string = $chars[int(rand(26))];
	$answer = "NO";
}
if($min > 0){
	#print "MIN requirement met.\n";
	$string .= $chars[int(rand(26))];
	my $tokens = int(rand(4)) + 1;
	for(my $i = 0; $i < $tokens; $i++){
		my $length = int(rand(6)) + 1;
		$string .= " ";
		for(my $j = 0; $j < $length; $j++){
			$string .= $chars[int(rand(26))];
		}
	}
	if($que > 0){
		#print "QUE requirement met.\n";
		$string .= "?";
	} else {
		#print "QUE requirement NOT met.\n";
		$answer = "NO";
		my $rnd = int(rand(100)) % 3;
		if($rnd == 0){
			$string .= ".";
		} elsif($rnd == 1){
			$string .= "!";
		} else {
			$string .= "";
		}
	}
} else {
	#print "MIN requirement NOT met.\n";
	$answer = "NO";
	if($que > 0){
		#print "QUE requirement met.\n";
		$string .= "?";
	} else {
		#print "QUE requirement NOT met.\n";
		$answer = "NO";
		my $rnd = int(rand(100)) % 3;
		if($rnd == 0){
			$string .= ".";
		} elsif($rnd == 1){
			$string .= "!";
		} else {
			$string .= "";
		}
	}
}		
			


print INFILE "$string\n";
print OUTFILE "$answer\n";
	
