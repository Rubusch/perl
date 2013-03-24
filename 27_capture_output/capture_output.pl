#!/usr/bin/perl
use strict;
##
##
##

print "capture the output of \'ls -al\'\n";

## call command: ls -al
my @ls_output = `ls -al`;

## output list
print (@ls_output) . "\n";

print "READY.\n";
