#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
$|=1;
sub main {
   my $file = '../Resources/my-man-jeeevs.txt';
    open(INPUT,$file) or die("$file not found!");
    while(my $line = <INPUT>){
        if ($line =~ /(s.*n)/) {
            print "$1\n"
        }
    }
    close(INPUT)

}

main();
# the function above gives us the following output, this is because
# '*' is a greedy quantifier, it matches as many characters between 's' and 'n' as possible

# s and charitable donations in all 50 states of the Un
# s. Compliance requirements are not uniform an
# siderable effort, much paperwork and many fees to meet an
# se requirements. We do not solicit donations in location
# status of compliance for an
# sit www.gutenberg.org/don
# solicit contribution
# solicitation requirements, we know of no prohibition
# st accepting unsolicited donations from donors in
# s with offers to don
# s are gratefully accepted, but we cann
# statements concerning tax treatment of donation
# side the United States. U.S. laws alon
# se check the Project Gutenberg web pages for current donation
# s and addresses. Donations are accepted in a n
# s including checks, online payments and credit card donation
# se visit: www.gutenberg.org/don
# ssor Michael S. Hart was the origin
# shared with anyone. For forty years, he produced an
# stributed Project Gutenberg™ eBooks with only a loose n
# s are often created from several prin
# s, all of which are confirmed as not protected by copyright in
# ss a copyright notice is included. Thus, we do n
# ssarily keep eBooks in compliance with an
# st people start at our website which has the main
# s website includes information about Project Guten
# s to the Project Guten
# s, an
# subscribe to our email newsletter to hear about n

# we can turn '*' from greedy to non-greedy using the following syntax
sub nonGreedy {
    my $file = '../Resources/my-man-jeeevs.txt';
    open(INPUT,$file) or die("$file not found!");
    while(my $line = <INPUT>){
        if ($line =~ /(s.*?n)/) {
            print "$1\n"
        }
    }
    close(INPUT)


}

nonGreedy();
# now as you can see, we stop at the first occurence of 'n' in the sentence

# shared with an
# stributed Project Guten
# s are often
# s, all of which are con
# ss a copyright n
# ssarily keep eBooks in
# st people start at our website which has the main
# s website in
# s to the Project Guten
# s, an
# subscribe to our email n
