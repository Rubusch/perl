#!/usr/bin/perl
use strict;
##
## splitting a lists content into text blocks, version 2
##
## cuts leading "Cell ", but appends trailing "Cell "

local $/ = "Cell "; #/^ *Cell \d\d - / doesn't work

my $file = './raw.txt';
open(INFO, "<$file") or die $!;
my @lines = <INFO>;
close(INFO);

## show block with idx 2
print $lines[2] . "\n";

print "READY.\n";
