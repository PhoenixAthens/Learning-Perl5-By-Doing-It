#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use IO::File;

sub reading_lines {
    my $fileName = "../Resources/my-man-jeeevs.txt";
    my $fh = IO::File->new($fileName,"r");
    unless($fh){
        print("Couldn't open $fileName\n");
        exit;
    }
    my $count = 0;
    while($fh->getline){
        $count++;
    }
    $fh->close();
    print("$fileName has $count lines.\n");
}
reading_lines();
# ../Resources/my-man-jeeevs.txt has 7250 lines.