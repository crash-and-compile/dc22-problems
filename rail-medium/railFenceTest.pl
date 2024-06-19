#!/usr/bin/perl -w
use strict;

use FindBin;
use lib $FindBin::Bin;

use CNC::RailFence qw(toRailFence fromRailFence);
use CNC::Generator qw(upperLettersTransform);

my $words = CNC::Generator::createWordList();
print $words, "\n";

my $text = "defend the east wall of the castle";
my $amplitude = 4;
my $cipher = toRailFence($text, $amplitude);
my $plain = fromRailFence($cipher, $amplitude);
print "Success: ", $plain eq $text ? "true" : "FALSE!!!!!", "\n\t[$text][$plain][$cipher][$amplitude]\n";

foreach (0..100) {
  my $text = CNC::Generator::createWordList(
     required => 'password', wordTransform => \&upperLettersTransform);
  my $amplitude = int(rand(15-3)) + 3;
  my $cipher = toRailFence($text, $amplitude);
  my $plain = fromRailFence($cipher, $amplitude);
  if ($plain ne $text) {
    print "\nSuccess: ", $plain eq $text ? "true" : "FALSE!!!!!", "\n\t[$text][$plain][$cipher][$amplitude]\n";
  }
  else  {
    print ".";
  }
}
print "\n";

