#!/usr/bin/perl
use strict;
use warnings;
## 
## splitting a lists content into text blocks
##
## Usage: $0 raw.txt

my @blocks;
for(my $idx=0; <>; $blocks[$idx] .= $_){
    ++$idx if /^ *Cell \d\d - /;
}

## show block with idx 2
print $blocks[2] . "\n";

print "READY.\n";
