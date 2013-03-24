#!/usr/bin/perl
##
## read from a file
##

print "cat a file:\n";

my $file = './test.txt';
open(INFO, "<$file") or die $!;
my @lines = <INFO>;
close(INFO);
print @lines;

print "READY.\n";
