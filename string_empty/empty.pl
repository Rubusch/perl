#!/usr/bin/perl
##
## string is empty
##

use warnings;
use strict;


print "'test' declared\n";
my $test = "";

## 1. conditional
$test ? print "'test' not empty\n" : print "'test' is empty\n";

## 2. conditional
print "'test' is empty\n" if not $test;

## 3. conditional
print "'test' is empty\n" if $test eq ""; ## '== 0' is not possible

## init with "" brings output
print "foooooooooooooooooooo\n" if not my $second = $test;

## init with "something" brings no output
print "faaaaaaaaaaaaaaaaaaaa\n" if not my $second = "something";

print "READY.\n";

