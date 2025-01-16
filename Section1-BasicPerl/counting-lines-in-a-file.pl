#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
# use v5.10;
sub counter_lines {
    my $fileName = "../Resources/my-man-jeeevs.txt";
    open(INPUT,$fileName) or die("$fileName not found");
    my @lineArray = <INPUT>;
    close(INPUT);
    my $lines = scalar(@lineArray);
    print("There are $lines in $fileName\n");
}
counter_lines();
# There are 7250 in ../Resources/my-man-jeeevs.txt
