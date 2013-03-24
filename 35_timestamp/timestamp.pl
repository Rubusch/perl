#!/usr/bin/perl
##
## set timestamp
##
use strict;
use warnings;

print "set timestamp\n\n";

## set timestamp using bash commands
`touch -t 197609271107.00 ./test.txt`;

