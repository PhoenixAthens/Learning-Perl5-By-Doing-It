#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use v5.18;

my %hsh = (1=>"eins",2=>"zwei",3=>"drei",4=>"vier",5=>"fünf",6=>"sechs",7=>"sieben",8=>"acht",9=>"neun",10=>"zehn");
my %hash2 = ("one"=>"uno","two"=>"dos","three"=>"tres","four"=>"quadro");

# printing values in a hash using while loop and 'each'
while(my ($k,$v) = each %hsh){
    say qq|$k -> $v|;
}

# printing values in a hash using for loop and 'keys'
foreach my $k (keys %hash2){
    say qq|$k -> $hash2{$k}|;
}

# modifying the values of a hash
$hsh{1}="ek";
while(my($k,$v)=each %hsh){
    say qq|$k -> $v|;
}

# adding a value to a hash
$hsh{11}="elf";
foreach my $k (keys %hsh){
    say qq|$k -> $hsh{$k}|;
}

#deleting values from a hash
delete $hsh{3};
my $count=0;
foreach my $k (keys %hsh){
    say qq|$k -> $hsh{$k}|;
    $count++;
}
say $count;

#sorting the values in a hash based on keys (ascii sort)
say qq|=========================|;
foreach my $k (sort(keys(%hsh))){
    print qq|$k -> $hsh{$k}; |;
}
print("\n");
# 1 -> ek; 10 -> zehn; 11 -> elf; 2 -> zwei; 4 -> vier; 5 -> fünf; 6 -> sechs; 7 -> sieben; 8 -> acht; 9 -> neun;

#sorting the values in a hash based on keys (numeric sort) (ascending order)
say qq|=========================|;
foreach my $k (sort{$a<=>$b}(keys(%hsh))){
    print qq|$k -> $hsh{$k}; |;
}
print("\n");
# 1 -> ek; 2 -> zwei; 4 -> vier; 5 -> fünf; 6 -> sechs; 7 -> sieben; 8 -> acht; 9 -> neun; 10 -> zehn; 11 -> elf;


#sorting the values in a hash based on keys (numeric sort) (descending order)
say qq|=========================|;
foreach my $k (sort{$b<=>$a}(keys(%hsh))){
    print qq|$k -> $hsh{$k}; |;
}
print("\n");
# 11 -> elf; 10 -> zehn; 9 -> neun; 8 -> acht; 7 -> sieben; 6 -> sechs; 5 -> fünf; 4 -> vier; 2 -> zwei; 1 -> ek;

#%hsh{1,2,3}; # 1ek2zwei3%

# can't do the following
# %hsh{1,2,3}={"ek","do","teen"};
# say $hsh{1};
# say $hsh{2};
# say $hsh{3};

delete %hsh{1,2,3};
foreach my $k (sort{$a<=>$b}(keys(%hsh))){
    print qq|$k -> $hsh{$k}; |;
}
# 4 -> vier; 5 -> fünf; 6 -> sechs; 7 -> sieben; 8 -> acht; 9 -> neun; 10 -> zehn; 11 -> elf;

