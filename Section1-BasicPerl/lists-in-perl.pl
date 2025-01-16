#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
sub lists_in_perl() {
    my %names = ("James",1, "kuko",2, "hannah",3);

    # my @names = ("James"=>1, "kuko"=>2, "hannah"=>3);
    # print(
    #     "\$names[0]: $names[0]\n",
    #     "\$names[1]: $names[1]\n",
    #     "\$names[2]: $names[2]\n"
    # );
    # $names[0]: James
    # $names[1]: 1
    # $names[2]: kuko

    print(
        "\$names[0]: $names{'James'}\n",
        "\$names[1]: $names{'kuko'}\n",
        "\$names[2]: $names{'hannah'}\n"
    );
    # $names[0]: 1
    # $names[1]: 2
    # $names[2]: 3


}
lists_in_perl();

sub creatingAHash(){
    my %hash = ("A"=>1,"B"=>2,"C"=>3);
    print(
        "$hash{'A'}\n"."$hash{'B'}\n"."$hash{'C'}\n"
    );
    my @listOfChars = ('a','b','c','d');
    print("@listOfChars\n");
    # a b c d

    # my @listOfChars_2 = (a,b,c,d);
    # print("@listOfChars_2");
    # a b c d
    # Above output is generated only if we turn off "use strict" and "use warnings FATAL => 'all'"

}
creatingAHash();
# 1
# 2
# 3

sub operationsOnLists(){
    my @listOfNames = ("Person1","Person2","Person3","Person4");
    print("$listOfNames[0]\n");  # Person1
    print("$listOfNames[-1]\n"); # Person4

    my @listSlice;
    @listSlice[0,1] = @listOfNames[2,3];
    print("$listSlice[0], $listSlice[1]\n"); #Person3, Person4
}
operationsOnLists();

sub rangesAndLists(){
    my @listOfIntegers = (1..10);
    print("@listOfIntegers \n"); # 1 2 3 4 5 6 7 8 9 10

    my @customListOfIntegers = (2, 4..8, 10);
    print("@customListOfIntegers \n"); # 2 4 5 6 7 8 10

    my @listOfIntegersWithBreaks = (1..10);
    print("@listOfIntegersWithBreaks \n"); # 1 2 3 4 5 6 7 8 9 10

    # the following list will also contain the integers less than or equal to the floor of lower bound and upper bound
    my @listOfIntegersFromFloatRange = (2.1..8.5);
    print("@listOfIntegersFromFloatRange \n"); # 2 3 4 5 6 7 8

    my @listOfIntegersFromFloatRange_2 = (2.1..8.9);
    print("@listOfIntegersFromFloatRange_2 \n"); # 2 3 4 5 6 7 8

    # ranges on characters
    my @charList = ('aa'..'ae'); # there is no difference if we enclose 'aa' and 'ae' in double quotes rather than single quotes
    print("@charList \n"); # aa ab ac ad ae
    # as you can see in the output above, we didn't had to do extra work to get spaces between the values in the range,
    # the perl interpreter did that automatically for us!

    my @charList_2 = ("aa".."ae");
    print("@charList_2 \n"); # aa ab ac ad ae

    my $val1;
    my $val2;
    ($val1, $val2) = @charList;
    print("$val1, $val2\n"); # aa, ab

}
rangesAndLists();

sub ListMethods {
    my @numbers = (92,34,11,100,2,51,1034);
    my @number_sorted_1 = sort @numbers;
    print("@number_sorted_1\n");
    # 100 1034 11 2 34 51 92

    # however if we specify the sort order along with the sort operation, like shown below, we get
    my @number_sorted_2 = sort {$a <=> $b} @numbers;
    print("@number_sorted_2 \n");
    # 2 11 34 51 92 100 1034

    my @number_sorted_3 = reverse sort {$a <=> $b} @numbers;
    print("@number_sorted_3 \n");
    # 1034 100 92 51 34 11 2

}
ListMethods();