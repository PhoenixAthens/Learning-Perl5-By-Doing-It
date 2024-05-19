#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
$|=1;
sub main {
    my $inputFile = '../Resources/my-man-jeeevs.txt';
    my $outputFile = '../Resources/output.txt';

    open(INPUT,$inputFile) or die("$inputFile not found!\n");
    open(OUTPUT,'>'.$outputFile) or die("$outputFile couldn't be created!\n");

    while(my $currLine = <INPUT>){
        if ($currLine =~ /\begg\b/) {
            $currLine =~ s/hen/DOG/ig;
            # 'i' to say case-insensitive, 'g' to say globally, not just the first-occurrence!
            print OUTPUT $currLine;
        }
    }
    close(INPUT);
    close(OUTPUT);
}
main;