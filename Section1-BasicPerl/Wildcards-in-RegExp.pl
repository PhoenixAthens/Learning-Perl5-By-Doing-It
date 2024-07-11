#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';

$|=1;

sub main {
    my $file = '../Resources/my-man-jeeevs.txt';
    open(INPUT, $file) or die ("$file doesn't exist!\n");

    while(my $line = <INPUT>){
        if ($line =~ / his /) {
            # to match any 3 letter character that starts with 'h',
            # ends with 's' we can use `$line =~ / h.s /`, the '.' represents any
            # character
            print($line);
        }
    }
    close(INPUT)
}
#main();

# using the `.` wildcard
# this subroutine prints all lines that have a match for a word
# that starts with 'h' and ends with 's'
sub wildcards{
    my $file = '../Resources/my-man-jeeevs.txt';
    open(INPUT, $file) or die("$file not found!\n");
    while(my $line = <INPUT>){
        if ($line =~ / h.s /) {
            # we could also have used something like
            # /I..a./
            # and this would have matched to "I have", "I was", "I had", etc..
            print($line)
        }
    }
    close(INPUT)

}

wildcards();
