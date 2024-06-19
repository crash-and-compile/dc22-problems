#!/usr/bin/perl
use strict;

use List::Util qw(shuffle);

my ($problem_file, $solution_file) = @ARGV;
open(INFILE,">$problem_file");
open(OUTFILE,">$solution_file");

for (0..100+int(rand(50))) {

my @array = ();
for(my $x = 1; $x <= 15 + int(rand(25)); $x++){
	if(length($x) == 1){ $x = " " . $x;}
	$array[$x-1] = $x;
}
my @sarray = shuffle(@array);
#print "                  $sarray[0]\n";
#print "        $sarray[1]                   $sarray[2]\n";
#print "   $sarray[3]        $sarray[4]         $sarray[5]         $sarray[6]\n";
#print "$sarray[7]   $sarray[8]    $sarray[9]   $sarray[10]    $sarray[11]   $sarray[12]    $sarray[13]   $sarray[14]\n";
my $string = join(" ",@sarray);
my $node = int(rand(scalar @sarray - ($#sarray / 2)));;
my $val = $sarray[$node];

# 0: Parent, 1: LChild, 2: RChild, 3: Sibling
my $choice = int(rand(4));
my $otherNode;
while (!defined $otherNode) {
	if ($choice == 0) {
		if ($node == 0) {
			$choice = 1;
			next;
		}

		$otherNode = int(($node - 1) / 2);
	}
	elsif ($choice == 1) {
		my $lChild = $node * 2 + 1;
		if ($lChild > $#sarray) {
			$choice = 3;
			next;
		}

		$otherNode = $lChild;
	}
	elsif ($choice == 2) {
		my $rChild = $node * 2 + 2;
		if ($rChild > $#sarray) {
			$choice = 3;
			next;
		}

		$otherNode = $rChild;
	}
	elsif ($choice == 3) {
		if ($node == 0) {
			$choice = 1;
			next;
		}

		# Even is a right child, odd is a left.
		my $sibling = ($node % 2 == 0) ? $node - 1 : $node + 1;
		if ($sibling > $#sarray) {
			$choice = 0;
			next;
		}

		$otherNode = $sibling;
	}
}

my $relat;
if ($choice == 0) { $relat = "PARENT"; }
elsif ($choice == 1) { $relat = "LEFT CHILD"; }
elsif ($choice == 2) { $relat = "RIGHT CHILD"; }
elsif ($choice == 3) { $relat = "SIBLING"; }

my $otherNodeVal = $sarray[$otherNode];
$string =~ s/ +/ /g;
$string =~ s/^ //g;
$string =~ s/ $//g;
$val =~ s/ //g;
$otherNodeVal =~ s/ //g;
#print "\nLeft child of [$val] is [$child]\n\n";
print INFILE "$string\n$node $otherNodeVal\n";
print OUTFILE "$relat\n";

}

