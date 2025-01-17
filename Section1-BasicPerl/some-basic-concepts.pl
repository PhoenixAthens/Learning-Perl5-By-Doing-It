#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use v5.18;
# use IO::File qw(getline new close);
# use Cwd qw(realpath cwd getcwd);
# use Cwd ("realpath", "cwd", "getcwd");
#creating an array
my @values = (1,2,3,4,5);
say foreach @values;
# 1
# 2
# 3
# 4
# 5
say @values; # 12345
print @values; # 12345
print foreach @values; # 12345

# an easy way to obtain the length of an array is to assign the array to a scalar variable, like so
my $length_of_array = @values;
say "The length of the array is $length_of_array"; #The length of the array is 5

# assigning values from array to a list of scalars
my ($a, $b, $c) = @values;
say($c); #3
say($b); #2
say($a); #1

my @numbers = (1,2,3,4,5,99,12,'abc',"bd",23);
foreach my $val (@numbers){
    say("Currently at -> ${val}")
}
# Currently at -> 1
# Currently at -> 2
# Currently at -> 3
# Currently at -> 4
# Currently at -> 5
# Currently at -> 99
# Currently at -> 12
# Currently at -> abc
# Currently at -> bd
# Currently at -> 23

my $n = 32;
$n *= 100;
$n .= "HOLA";
say $n; # 3200HOLA
# $n += 23;
# say $n; #Argument "3200HOLA" isn't numeric in addition (+) at some-basic-concepts.pl line 47.
$n x= 2;
say $n ; #3200HOLA3200HOLA

my $str = "Bazingaaa!";
$str = "Hello there \"${str}\" what did you just say to me?";
# Hello there "Bazingaaa!" what did you just say to me?
say $str;

# the qq operator
my $str2 = "Hooligans";
$str2 = qq(we are the "${str2}"!);
say($str2); # we are the "Hooligans"!

$str2 = qq|No, this statement '${str2}' is false. :<|;
say($str2); # No, this statement 'we are the "Hooligans"!' is false. :<

$str2 = qq[Yes, we once were the Hooligans! but as I said `${str2}`]; # we can also use {} or // instead of [] here!
say($str2); #Yes, we once were the Hooligans! but as I said `No, this statement 'we are the "Hooligans"!' is false. :<`

my @readme = ("jk","fk","lk","pk");
say foreach @readme;
# jk
# fk
# lk
# pk

#using the qw (quote word) operator
say foreach qw(one two three);
# one
# two
# three

# just like every other language the arrays are zero-based on Perl
my @array_of_vals = qw(1 2 3 4 45);
say $array_of_vals[3]; # 4
# say @array_of_vals[3]; #Scalar value @array_of_vals[3] better written as $array_of_vals[3] at some-basic-concepts.pl line 86.

say foreach @array_of_vals;

# to add elements to the end of the array, we can use the `push` operator
push(@array_of_vals, qw(100 200 300));
foreach my $elem (@array_of_vals){
    print("$elem ");
}
# 1 2 3 4 45 100 200 300
print("\n");
# to remove element from the end of the array, we can use the 'pop' operator
my $removed_element = pop(@array_of_vals);
foreach my $elem (@array_of_vals){
    print("$elem ");
}
print("\n");
say qq|Removed element: $removed_element|;
# 1 2 3 4 45 100 200
# Removed element: 300

# we can also add and remove elements from the beginning of the array using 'shift' and 'unshift' operators respectively
shift(@array_of_vals);
foreach my $elem (@array_of_vals){
    print("$elem ");
}
# 2 3 4 45 100 200
print("\n");
unshift(@array_of_vals, "1001");
foreach my $elem (@array_of_vals){
    print("$elem ");
}
print("\n");
# 1001 2 3 4 45 100 200
unshift(@array_of_vals, qw(00 01 02 03));
foreach my $elem (@array_of_vals){
    print("$elem ");
}
print("\n");
# 00 01 02 03 1001 2 3 4 45 100 200

# array-slices
my @array_to_slice = qw(one two three four five six seven eight nine ten);
say foreach @array_to_slice;

#printing elements at a certain index
say $array_to_slice[9];

#printing a slice of the array
foreach my $elem (@array_to_slice[1,9,7,5]){ # as you can see, we can print any index like so
    print($elem." ");
}
print("\n"); # two ten eight six

#printing a slice of the array using ranges
foreach my $elem (@array_to_slice[4..7]){
    print($elem." ");
}
print("\n"); #five six seven eight



