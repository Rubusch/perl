#!/usr/bin/perl
## 
## demonstrates the bash utilities 'basename' and 'dirname'
use strict;
use warnings;


## strips off the filename, w/o extension
sub basename($) { my $file = shift; $file =~ s!^(?:.*/)?(.+?)(?:\.[^.]*)?$!$1!; return $file; }

## strips off the foldername of the specified file
sub dirname($) {my $file = shift; $file =~ s!/?[^/]*/*$!!; return $file; }


## start
my $path = "/fulano/beltrano/cicrano.txt";

print "path:\t\t$path\n";
print "basename:\t" . &basename( $path ) . "\n";
print "dirname:\t" . &dirname( $path ) . "\n";

print "READY.\n";
