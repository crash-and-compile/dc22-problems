#!/usr/bin/perl
use GD;
use GD::Image;
use GD::Simple;
use MIME::Base64;

($problem_file, $solution_file) = @ARGV;
open(INFILE,">$problem_file");
open(OUTFILE,">$solution_file");

$img = GD::Simple->new(100,100);
my $lines = int(rand(5))+1;
for(my $linecnt = 0; $linecnt < $lines; $linecnt++){
	my $startx = int(rand(100)); 
	my $starty = int(rand(100)); 
	my $endx = int(rand(100)); 
	my $endy = int(rand(100)); 
	$img->moveTo($startx,$starty);
	$img->lineTo($endx,$endy);
} 
my $encoded = MIME::Base64::encode($img->png);
#print "$encoded\n";
$decoded = MIME::Base64::decode($encoded);
my $inputfile = "test.png";
open my $out, '>', $inputfile or die;
binmode $out;
print $out $img->png;	
print INFILE "$encoded";
print OUTFILE "$lines\n";

