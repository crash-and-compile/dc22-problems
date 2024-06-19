#!/usr/bin/perl

($problem_file, $solution_file) = @ARGV;
open(INFILE,">$problem_file");
open(OUTFILE,">$solution_file");

for (0..150 + int(rand(100))) {

my @goodone = ("Is","Are");
my @goodtwo = ("the same as","not the same as","different from");
my $string1 = "";
my $string2 = "";
my $length = int(rand(6)) + 1;
my @chars = ("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q"
,"r","s","t","u","v","w","x","y","z");
for(my $j = 0; $j < $length; $j++){
	$string1 .= $chars[int(rand(26))];
}

$length = int(rand(6)) + 1;
for(my $j = 0; $j < $length; $j++){
	$string2 .= $chars[int(rand(26))];
}



my $string = "";
my $answer = "YES";
my @string = ();
my $second = $goodtwo[int(rand(3))];
push(@string,$goodone[int(rand(2))]);
push(@string,$string1);
push(@string,$second);
my $same = int(rand(100)) % 2;
if($same == 0){
	push(@string,$string1);
} else {
	push(@string,$string2);
}
if(($same == 0)&&($second =~ /same as/)&&(!($second =~ /not the same as/))){
	$answer = "YES";
} elsif((($same == 1)&&($second =~ /different/))){
	$answer = "YES";
} elsif((($same == 1)&&($second =~ /not the same as/))){
	$answer = "YES";
} else {
	$answer = "NO";
}
$string = join(" ",@string);
$string .= "?";
print INFILE "$string\n";
print OUTFILE "$answer\n";

}

