#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
$|=1;

sub main {
    my $file = '../Resources/my-man-jeeevs.txt';
    open(INPUT, $file) or die("$file doesn't exist!");
    while(my $line = <INPUT>){
        if ($line =~ /(I..a.)/) {
            print("First match: $1\n");
        }
    }
    close();
}
#main();
# First match: I had
# First match: I sai
# First match: I cau
# First match: I sai
# First match: I can
# First match: I sai
# First match: I sai
# First match: I cam
# ....

sub moreRegexp{
    my $file = '../Resources/my-man-jeeevs.txt';
    open(INPUT,$file) or die("$file not found!");
    while(my $line = <INPUT>){
        if ($line =~ /(I..a.)(...)/) {
            print("printing whole thing: '$0', First match: '$1', Second match: '$2'\n");
        }
        # $0 refers to the name of the perl script!
    }
    close(INPUT)
}
moreRegexp();
# printing whole thing: 'capture-Groups.pl', First match: 'I had', Second match: ' on'
# printing whole thing: 'capture-Groups.pl', First match: 'I sai', Second match: 'd t'
# printing whole thing: 'capture-Groups.pl', First match: 'I cau', Second match: 'ght'
# printing whole thing: 'capture-Groups.pl', First match: 'I sai', Second match: 'd, '
# printing whole thing: 'capture-Groups.pl', First match: 'I can', Second match: ', �'
# printing whole thing: 'capture-Groups.pl', First match: 'I sai', Second match: 'd, '
# printing whole thing: 'capture-Groups.pl', First match: 'I cam', Second match: 'e t'
# printing whole thing: 'capture-Groups.pl', First match: 'I was', Second match: ' se'
# printing whole thing: 'capture-Groups.pl', First match: 'I wan', Second match: 't y'
# printing whole thing: 'capture-Groups.pl', First match: 'I was', Second match: ' wi'
# printing whole thing: 'capture-Groups.pl', First match: 'I saw', Second match: ' hi'