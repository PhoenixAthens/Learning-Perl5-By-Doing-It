#!/usr/bin/perl
use strict;
use v5.18;
use warnings FATAL => 'all';
use constant PI => 3.14;
use constant author => "Khanna";

use constant{
    first  => 1,
    second => 2,
    third  => 3,
};
main(@ARGV);
sub main {
    say PI;
    say author;
    # my $v1 = shift;
    # my $v2 = shift;
    # say $v1 $v2;
    # Can't use string ("PI") as a symbol ref while "strict refs" in use at constants-in-perl.pl line 13.

    say first; # 1
    say second; # 2
    say third; # 3
}