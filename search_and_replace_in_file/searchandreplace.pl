#!/usr/bin/perl

use strict;
use warnings;

my $filename = 'some_file.txt';
my $find = 'this';
my $replace = 'that';

{
    # set up filename to replace
    local @ARGV = ($filename);

    # backup
    local $^I = '.bac';
    while( <> ){
        if( s/$find/$replace/ig ) {
            print;
        }else {
            print;
        }
    }
}
print "Finished";
