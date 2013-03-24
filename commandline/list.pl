#!/usr/bin/perl
use strict;
use warnings;

die "usage: $0 <directory>\n" if @ARGV != 1;
my $dir = shift; die $! if !-e $dir;

print `ls -la $dir` . "\n";

print "READY.\n";

