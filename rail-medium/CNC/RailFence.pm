#!/usr/bin/env perl -w
use strict;

package CNC::RailFence;

use base 'Exporter';
our @EXPORT_OK = qw(toRailFence fromRailFence);

sub railIndices($) {
   my ($amplitude) = @_;

  my @indices = (0..($amplitude - 1));
  push @indices, reverse (1..($amplitude - 2));

  return @indices;
}

sub toRailFence($$) {
  my ($letters, $amplitude) = @_;

  if (ref($letters) ne "ARRAY") {
    my @letters = split '', $letters;
    $letters = \@letters;
  }

  my @indices = railIndices($amplitude);

  my @rails = map { [] } (0..($amplitude - 1));
  for (my $i = 0; $i <= $#$letters; $i++) {
    push @{$rails[$indices[$i % scalar(@indices)]]},  $$letters[$i];
  }

  my @result;
  for (my $i = 0; $i < scalar(@rails); $i++) {
    push @result, @{$rails[$i]};
  }

  return wantarray ? @result : join('', @result);
}

sub fromRailFence($$) {
  my ($cipherText, $amplitude) = @_;

  if (ref($cipherText) ne "ARRAY") {
    my @cipherText = split '', $cipherText;
    $cipherText = \@cipherText;
  }

  my @indices = toRailFence([0..$#$cipherText], $amplitude);

  my @result;
  map { $result[$indices[$_]] = $$cipherText[$_] } (0..$#$cipherText);

  return wantarray ? @result : join('', @result);
}

1;

