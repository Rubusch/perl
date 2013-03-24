#!/usr/bin/perl
use strict;
use warnings;
## cuts word out of block
##


## read in exp.txt
my $file = './raw.txt';
open(INFO, "<$file") or die $!;
my $block = join('', <INFO>);
close(INFO);

my @essid = $block =~ /\n *ESSID:"(.*)"/xg;

print (@essid);

print "\nREADY.\n";

