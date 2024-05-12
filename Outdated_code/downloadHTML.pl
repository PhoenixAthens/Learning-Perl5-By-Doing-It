#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use LWP::Simple;
sub main {
    # we can also use the same code to download images, just by replacing the html url with image url
    print("Downloading....\n");
    # the following method downloads and prints the html document to standard output
    get("{http url of website}");
    # "{http url to the website}" with http-url

    # the following method downloads and saves the html document to a file
    getstore("{http url of website}","{path to storage location}");
    # "{http url to the website}" with http-url, "{path to storage location}" with path to where you wish to store the html doc!

    # the getstore() method returns status codes indicating the status of the get request
    my $statCode = getstore("{url}","{path}");
    if ($statCode == 200) {
        print("Success\n");
    }else{
        print("Ohh no!\n");
    }
    print("Finished!\n");
}
main();