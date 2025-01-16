#!/usr/bin/perl
use strict;
# use warnings FATAL => 'all';
sub main(){
   my $firstName = 'Phoenix';
    my $lastName = "Athens";
    my $fullName = $firstName.'-'.$firstName ;
    print $fullName."\n";
    #Phoenix-Phoenix
}
main();

# A note about string concatenation!
# 1. The strings to be concatenated do not necessarily have to enclosed in double quotes
# 2. The string say "\n" must be enclosed in double quotes, otherwise it will be treated as a literal string

sub operationsOnStrings {
    my $stringVar = "abc";
    print($stringVar * 2);
    print("\n");
}
operationsOnStrings(); # 0
# Argument "abc" isn't numeric in multiplication (*) at strings-in-perl.pl line 19.

sub operationsOnStrings_2 {
    my $stringVar = 'abc';
    print($stringVar * 2);
    print("\n");
}
operationsOnStrings_2(); # 0
# Argument "abc" isn't numeric in multiplication (*) at strings-in-perl.pl line 19.

# However, if you turn of the warnings, the code will run and the output of the above two functions will be: 0

sub operationOnAlphanumericStrings() {
    my $stringVar = "12P34";
    print($stringVar * 2);
    print("\n");
}
operationOnAlphanumericStrings(); # 24
# if "use warnings FATAL => 'all';" is not commented out!
# Argument "12P34" isn't numeric in multiplication (*) at strings-in-perl.pl line 37

sub incrementOnStrings() {
    my $strName = "abc";
    print(++$strName);
    print("\n");
}
incrementOnStrings(); # abd
# this works despite having "Add use warnings FATAL => 'all';" uncommented

sub multiplicationOnStrings() {
    my $strName = "abc";
    print($strName x 2);
    print("\n");
}
multiplicationOnStrings(); #abcabc

sub multiplicationOnStrings_2() {
    my $strName = "1.2p34";
    print($strName * 3); # 3.6
    print("\n");
}
multiplicationOnStrings_2(); #

sub incrementOnStrings_2() {
    my $strName = "z";
    print(++$strName); #
    print("\n");
}
incrementOnStrings_2(); # aa
# if strName had the value "aa" stored in it, incrementOnString_2 would've outputted "ab"
