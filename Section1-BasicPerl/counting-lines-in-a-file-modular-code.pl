#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use v5.10;
use IO::File;
main(@ARGV);
$|=1;
sub main {
    my $fileName = shift || "../Resources/my-man-jeeevs.txt";
    my $counter = countlines($fileName);
    say "$fileName has $counter lines!";
}
sub countlines {
    my $fName = shift;
    error("Missing filename") unless($fName);
    my $fh = IO::File->new($fName,"r") or error("File construction failed! Cannot open $fName ($!)\n");
    my $count = 0;
    $count++ while($fh->getline);
    $fh->close;
    return $count;
}
sub error {
    my $e = shift || "Unknown error!";
    say "$0 : $e";
    exit 0;
}