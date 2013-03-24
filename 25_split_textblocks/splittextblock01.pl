#!/usr/bin/perl
use strict;
use warnings;
##
## splitting a lists content into text blocks, version 1
##

my $file = './raw.txt';
open(INFO, "<$file") or die $!;
my @lines = <INFO>;
close(INFO);

my @blocks;
for(my $idx=0; local $_ = shift @lines; $blocks[$idx] .= $_){
    ++$idx if /^ *Cell \d\d - .*/;
}

## show block with idx 4
print $blocks[4] . "\n";

print "READY.\n";



