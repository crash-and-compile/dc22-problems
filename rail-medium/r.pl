#!/usr/bin/perl -w
use strict;

use FindBin;
use lib $FindBin::Bin;

use CNC::RailFence qw(toRailFence fromRailFence);
use CNC::Generator qw(upperLettersTransform);

my $cipher = "";
my $plain = "";

while(<>)
{
  $cipher = $_;
  $cipher =~ s/^\n*//;
  $cipher =~ s/\n*$//;
  $plain = "";
  for(my $amp = 3 ; $amp < 16 ; $amp++)
  {
    $plain = fromRailFence($cipher, $amp);
    if($plain =~ m/PASSWORD/)
    {
      if($plain =~ m/([A-Z]PASSWORD|PASSWORD[A-Z])/)
      {
        # skip
      }
      else
      {
        print "$plain\n";
      }
    }
  }
}
