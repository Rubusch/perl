#!/usr/bin/perl
use strict;
use warnings;

die "usage: $0 <inputfile>\n" if @ARGV != 1;
my $filename = shift;
open(INFO, "<$filename") or die $!;
my @text = <INFO>; die "File empty!\n" if !@text;
close(INFO);

## read out characters
chomp(@text);
my @characters = split(//, (join "\n", @text));

## count characters 
my $num=$#characters;
print "$num characters read\n";

print "READY.\n";

