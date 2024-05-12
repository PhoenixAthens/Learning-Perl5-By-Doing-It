#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
$|=1;
sub main {
    my $filePath = '/Users/anmolkhanna/Downloads/Introduction.to.Algorithms.4th.Leiserson.Stein.Rivest.Cormen.MIT.Press.9780262046305.EBooksWorld.ir.pdf';
    if (-f $filePath) { # '-f' means check if the file exists or not
        print("File Exists!\n");
    }else{
        print("File doesn't exist!\n");
    }
}
main();
#File Exists!
# we could have also written out if conditional like so, without the variable like so
# if(-f '/Users/anmolkhanna/Downloads/Introduction.to.Algorithms.4th.Leiserson.Stein.Rivest.Cormen.MIT.Press.9780262046305.EBooksWorld.ir.pdf'){
#           //do something
# }

# we use single quotes around path, so that perl will not interpret any character seq. in path as special characters and try interpreting them
# we use double quotes around the message in print(), so that perl will interpret the `\n` in string as special character and interpret it appropriately

#learning to use template strings in perl
sub templates {
    my $fileName = '/Users/anmolkhanna/Downloads/peepcode-git.pdf';
    if (-f $fileName) {
        print("$fileName does exist \n");
    }else{
        print("$fileName doesn't exist!\n");
    }
}
templates();
# /Users/anmolkhanna/Downloads/peepcode-git.pdf does exist

#learning to use arrays
sub arrayOfFileNames {
    my @fileName = (
      '/Users/anmolkhanna/Downloads/Professional Node.js - Building Javascript Based Scalable Software.pdf',
        '/Users/anmolkhanna/Downloads/NASM-documentation.pdf',
        '/Users/anmolkhanna/Downloads/learningunixforosx_2ndedition.pdf',
        '/Users/anmolkhanna/Downloads/Linux-in-a-Nutshell-6th-Edition.pdfl',
    );
    foreach my $placeHolder (@fileName){
        if (-f $placeHolder) {
            print("$placeHolder does exist!\n");
        }else{
            print("$placeHolder doesn't exist!\n");
        }
    }
}
arrayOfFileNames();
#     /Users/anmolkhanna/Downloads/peepcode-git.pdf does exist
#     /Users/anmolkhanna/Downloads/Professional Node.js - Building Javascript Based Scalable Software.pdf does exist!
#     /Users/anmolkhanna/Downloads/NASM-documentation.pdf does exist!
#     /Users/anmolkhanna/Downloads/learningunixforosx_2ndedition.pdf does exist!
#     /Users/anmolkhanna/Downloads/Linux-in-a-Nutshell-6th-Edition.pdfl doesn't exist!



