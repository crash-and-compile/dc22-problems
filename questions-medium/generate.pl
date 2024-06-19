#!/usr/bin/perl
use Math::BaseCnv;

($problem_file, $solution_file) = @ARGV;
open(INFILE,">$problem_file");
open(OUTFILE,">$solution_file");

my @goodone = ("Is","Are");
my @badone = ("Has","is","are","Will");
my @badtwo = ("perform the same as","react the same as","do as well as","mean");
my @goodtwo = ("the same as","not the same as","different from");
my $string1 = "";
my $string2 = "";
my $length = int(rand(6)) + 1;
my @chars = ("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z");
for(my $j = 0; $j < $length; $j++){
	$string1 .= $chars[int(rand(26))];
}

$length = int(rand(6)) + 1;
for(my $j = 0; $j < $length; $j++){
	$string2 .= $chars[int(rand(26))];
}



my $goodone = int(rand(100)) % 4;
my $goodtwo = int(rand(100)) % 4;
my $que = int(rand(100)) % 4;
my $string = "";
my $answer = "YES";
my @string = ();
if($goodone > 0){
	#print "CAP requirement met.\n";
	push(@string,$goodone[int(rand(2))]);
} else {
	push(@string,$badone[int(rand(4))]);
	$answer = "NO";
}
push(@string,$string1);
if($goodtwo > 0){
	#print "CAP requirement met.\n";
	push(@string,$goodtwo[int(rand(3))]);
} else {
	push(@string,$badtwo[int(rand(4))]);
	$answer = "NO";
}
my $same = int(rand(100)) % 4;
if($same > 0){
	push(@string,$string1);
} else {
	push(@string,$string2);
}
$string = join(" ",@string);
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

print INFILE "$string\n";
print OUTFILE "$answer\n";
	
