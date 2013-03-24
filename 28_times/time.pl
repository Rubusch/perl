#!/usr/bin/perl
use strict;
use warnings;
##
## measure seconds and display some results
##

my $start = time();

## secs since epoch
print "time function: " . time() . "\n";

## gmtime
print "gmtime: " . gmtime() . "\n";

## local time
print "localtime: " . localtime() . "\n";


sleep 2;

my $dif = time() - $start;
print "Passed sec since script start: " . $dif . "\n";

print "READY.\n";
