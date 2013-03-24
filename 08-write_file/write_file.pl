#!/usr/bin/perl
##
## write to a file
##
use strict;
use warnings;

my $file = './test.txt';

## write
open(INFO, ">$file");

print INFO "fulano\nbeltrano\ncicrano\n";
close(INFO);

print "READY.\n";
