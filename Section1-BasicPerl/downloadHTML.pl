#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use LWP::UserAgent;
use IO::Socket::SSL;

my $ua = LWP::UserAgent->new(cookie_jar=>{});
$ua->ssl_opts(
    'SSL_verify_mode' => $IO::Socket::SSL::SSL_VERIFY_NONE,
    'verify_hostname'=>0
);
my $request = HTTP::Request->new('GET', 'https://caveofpython.com');

my $response = $ua->request($request);

unless($response ->is_success()){
    die $response->status_line();
}
my $content = $response->decoded_content();
print($content);
print("completed");

