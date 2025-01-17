#!/usr/bin/perl

#
#
# Wumpus Hard
#
# ./generate.pl <problem_text> <solution_text>
#

($problem_file, $solution_file) = @ARGV;


open(FILE,">$problem_file");
$games = int(rand(7)+3);
for($gamenum = 0 ; $gamenum <= $games ; $gamenum++)
{
  my @grid = ();
  my $ref = 0;
  my $self = int(rand(100));
  my $beast = int(rand(100));
  while($beast == $self){
	$beast = int(rand(100));
  }
  my $treasure = int(rand(100));
  while(($treasure == $self)||($treasure == $beast)){
	$treasure = int(rand(100));
  }
  for(my $i = 0; $i < 10; $i++){
	for(my $j = 0; $j < 10; $j++){
		if($ref == $treasure){
			$grid[$i][$j] = "T";
		} elsif ($ref == $beast){
			$grid[$i][$j] = "B";
		} elsif ($ref == $self){
			$grid[$i][$j] = "S";
		} else {
			$grid[$i][$j] = "_";
		}
		$ref++;
	}
  }
  #print "$ref\n";
  for(my $i = 0; $i < 10; $i++){
	for(my $j = 0; $j < 10; $j++){
		print FILE $grid[$i][$j];
	}
	print FILE "\n";
  }
  for(my $f = 0; $f < int(rand(50))+35; $f++){
	my $ref1 = int(rand(4));
	my $dir1 = "N";
	if($ref1 == 0){
		$dir1 = "N";
	} elsif($ref1 == 1){
		$dir1 = "S";
	} elsif($ref1 == 2){
		$dir1 = "W";
	} else {
		$dir1 = "E";
	}
	my $ref2 = int(rand(4));
	my $dir2 = "N";
	if($ref2 == 0){
		$dir2 = "N";
	} elsif($ref2 == 1){
		$dir2 = "S";
	} elsif($ref2 == 2){
		$dir2 = "W";
	} else {
		$dir2 = "E";
	}
	print FILE "$dir1 $dir2\n";
  }
  print FILE "END\n";
}

close FILE;	


# exec("cat $problem_file | /opt/crashandcompile/prob/wumpus-hard/w.py > $solution_file");

exec("cat $problem_file | /opt/crashandcompile/prob/wumpus-hard/wumpus.pl > $solution_file");
