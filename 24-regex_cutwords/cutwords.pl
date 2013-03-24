#!/usr/bin/perl
use strict;
use warnings;
##
##

my $text = qq~...
name: "foobar"
age: 20
...
na
me: "test"~;

## by default result as list
my @names = $text =~ /\n name: \s+ \"(.*)\"/xg;
print join "::", @names;

print "\nor\n";

## if only one element is expected
my ($name) = $text =~ /\n name: \s+ \"(.*)\"/x;
print $name;

print "\nor\n";

## or as variable (=~ writes to default $1, $2, ...)
$text =~ /\n name: \s+ \"(.*)\"/x;
print $1 . "\n";

print "READY.\n";
