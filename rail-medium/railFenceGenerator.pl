#!/usr/bin/perl -w
use strict;

use FindBin;
use lib $FindBin::Bin;

use Getopt::Long;

use CNC::RailFence qw(toRailFence fromRailFence);
use CNC::Generator qw(upperLettersTransform);

# === Parameters ===

my $count = 1;
my $overwrite = undef;
GetOptions("count=i" => \$count,
           "overwrite" => \$overwrite);
my $fileProblem = $ARGV[0];
my $fileSolution = $ARGV[1];

#die "You must specify a problem file" unless ($fileProblem);
#die "Problem file already exists" if (!$overwrite && -e $fileProblem);

#die "You must specify a solution file" unless ($fileSolution);
#die "Solution file already exists" if (!$overwrite && -e $fileSolution);


# === Main ===


my $prob = "";
my $sol = "";

foreach (0..($count - 1)) {
  my $text = CNC::Generator::createWordList(
     required => 'password', wordTransform => \&upperLettersTransform);
  my $amplitude = int(rand(15-3)) + 3;
  my $cipher = toRailFence($text, $amplitude);

  $prob .= "$cipher\n";
  $sol .= "$text\n";
}

if($fileProblem and $fileSolution)
{
  die "Problem file already exists" if (!$overwrite && -e $fileProblem);
  die "Solution file already exists" if (!$overwrite && -e $fileSolution);

  open(my $problem_fh, ">", $fileProblem) or die "Unable to create problem file <$fileProblem>: $!";
  open(my $solution_fh, ">", $fileSolution) or die "Unable to create solution file: <$fileSolution>: $!";

  print $problem_fh $prob;
  print $solution_fh $sol;

  close ($problem_fh);
  close ($solution_fh);
}
else
{
  print "$prob\n";
  print "$sol\n";
}
