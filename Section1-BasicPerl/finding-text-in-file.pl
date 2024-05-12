#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
$|=1;
#printing all lines in the file
sub main {
    my $fileName = './Resources/my-man-jeeevs.txt';
    open(INPUT,$fileName) or die("$fileName not found"); # the file handle 'INPUT' is named so by convention, it'll allow us to handle the file
        while(my $currLine = <INPUT> ){
            print("$currLine");
        }
    close(INPUT)
}
#main();

#printing lines that contain the word 'help'
sub helpLines {
    my $fileName = './Resources/my-man-jeeevs.txt';
    open(INPUT,$fileName) or die("$fileName not found!");
    while(my $cl = <INPUT>){
        if ($cl =~ / help /) {
            print($cl);
        }
    }
    close(INPUT);
}
#helpLines();
#     “I don’t see how one could help noticing.”
#     “I can’t help your troubles,” said Motty firmly. “Listen to me, old
#     In a way, I couldn’t help sympathizing with the fellow. He had about
#     didn’t help much. There was a gleam of light when the brother of
#     thousand ways, but no help to a fellow, if you know what I mean.
#     I couldn’t help gaping. Somehow one didn’t associate Voules with
#     I couldn’t help thinking the name seemed to freeze her a bit. Which was
#     which didn’t seem to help much, I hadn’t any remarks to make.
#     couldn’t help feeling, you know, like one of those Johnnies you read
#     “No, that wouldn’t help him. He doesn’t need to take anything. He wants
#     paper it all seemed easy enough, but I couldn’t help feeling there was
#     “I can’t help that. Aunt Isabel doesn’t like you. She asked me what you
#     on. So, for the love of Mike, come across to our table and help things
#     I can’t help thinking it must have been that word “will” that roused
#     agreement and help preserve free future access to Project Gutenberg™
#     Archive Foundation, how to help produce our new eBooks, and how to

#printing lines that contain the letter help in order
sub helpLines_inOrder {
    my $fileName = './Resources/my-man-jeeevs.txt';
    open(INPUT,$fileName) or die("$fileName not found!");
    while(my $currLine = <INPUT>){
        if ($currLine =~ /help/) {
            print($currLine);
        }
    }
    close(INPUT);
}
helpLines_inOrder();

# “I don’t see how one could help noticing.”
# help. Come, Motty! We have just time to see a few of the sights before
# take notes of your impressions! It will be such a help. Good-bye, Mr.
# “I can’t help your troubles,” said Motty firmly. “Listen to me, old
# In a way, I couldn’t help sympathizing with the fellow. He had about
# doing so little to help.”
# Bicky looked at me in a helpless kind of way. I’m bound to say I didn’t
# didn’t help much. There was a gleam of light when the brother of
# “Old Bicky rather exaggerated, sir,” I said, helping the chappie out.
# Detective’s Manual. “You’re a great help, Bobbie,” I said. “An
# “It’s a fine bit of memorizing,” I said; “but how does it help?”
# thousand ways, but no help to a fellow, if you know what I mean.
# She was sitting on the sand, helping a small, fat child build a castle.
# I couldn’t help gaping. Somehow one didn’t associate Voules with
# I couldn’t help thinking the name seemed to freeze her a bit. Which was
# which didn’t seem to help much, I hadn’t any remarks to make.
# couldn’t help feeling, you know, like one of those Johnnies you read
# “No, that wouldn’t help him. He doesn’t need to take anything. He wants
# paper it all seemed easy enough, but I couldn’t help feeling there was
# at me in a helpless sort of way. He hasn’t been brought up on Jeeves as
# sympathetic outlook. It helps you to understand other people’s
# help that is!”
# “I can’t help that. Aunt Isabel doesn’t like you. She asked me what you
# helped a bit.
# on. So, for the love of Mike, come across to our table and help things
# I can’t help thinking it must have been that word “will” that roused
# agreement and help preserve free future access to Project Gutenberg™
# Archive Foundation and how your efforts and donations can help, see
# Archive Foundation, how to help produce our new eBooks, and how to

# trying out die, "die" crashes the program!
sub justDie {
    my $fileName = '/Users/anmolkhanna/Downloads/Programming_Savings_2024/Perl/README.md';
    open(INPUT,$fileName);
    print("$fileName opened!\n");
    die; # we can write functions without round brackets, "die" crashes the program!
    print("I'll not be executed!\n");
    close(INPUT);
}
#justDie;
# OUTPUT
# /Users/anmolkhanna/Downloads/Programming_Savings_2024/Perl/README.md opened!
# Died at /Users/anmolkhanna/Downloads/Programming_Savings_2024/Perl/Section1-BasicPerl/finding-text-in-file.pl line 93.

# now what if we don't want to let user know what line number the sub-routine died at, we can use
sub justDie_2 {
    my $fileName = '/Users/anmolkhanna/Downloads/Programming_Savings_2024/Perl/README.md';
    open(INPUT,$fileName);
    print("$fileName opened!\n");
    die("$0 is dead!\n"); # we can write functions without round brackets
    print("I'll not be executed!\n");
    close(INPUT);
}
justDie_2;
# output:
#/Users/anmolkhanna/Downloads/Programming_Savings_2024/Perl/README.md opened!
#I am dead! at /Users/anmolkhanna/Downloads/Programming_Savings_2024/Perl/Section1-BasicPerl/finding-text-in-file.pl line 107.

# we can prevent line line number from showing up in the message by adding `\n` at the end of messaeg passed to `die`, like so
# die("I am dead!\n");

#OUTPUT:
#/Users/anmolkhanna/Downloads/Programming_Savings_2024/Perl/README.md opened!
#I am dead!

#if we use '$0' in the message passed to `die`
#OUTPUT
#/Users/anmolkhanna/Downloads/Programming_Savings_2024/Perl/README.md opened!
#w/Users/anmolkhanna/Downloads/Programming_Savings_2024/Perl/Section1-BasicPerl/finding-text-in-file.pl is dead!





