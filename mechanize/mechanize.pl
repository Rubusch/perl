#!/usr/bin/perl 
use strict;
use warnings;


## mechanize, perl web browsing - install via aptitude
use WWW::Mechanize;
our $PATH_INPUT="file:./remax-uma-casa/120521131-21.htm";


## error checking
my $mech = WWW::Mechanize->new( autocheck => 1 );

## fetch a page
#$mech->get( "http://search.cpan.org" );
$mech->get( $PATH_INPUT );

## fetch a page
print $mech->content;

## fetch a page into a file
$mech->get( "http://www.cpan.org/src/stable.tar.gz", ":content_file" => "stable.tar.gz" );

## fetch a password protected file
$mech->credentials( 'admin' => 'password' );
$mech->get( 'http://10.11.12.13/password.html' );
print $mech->content();

## find all image links
my @links = $mech->find_all_links( tag => "a", url_regex => qr/\.(jpe?g|gif|png)$/i );

## find all download links
my @links = $mech->find_all_links( tag => "a", text_regex => qr/\bdownload\b/i );


print "READY.\n";

