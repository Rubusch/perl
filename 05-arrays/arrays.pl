#!/usr/bin/perl
##
## arrays
##
use strict;
use warnings;

@food = ("apples", "pears", "eels");
@music = ("whistles", "flute");

## print array:
print "print array:\n";
print "'@food'\n\n";

## print element - index starts with 0:
print "print element:\n";
print "'$food[1]'\n\n";

## init list
@moremusic = ("organ", @music, "harp");
print "list merge in list:\n";
print "'@moremusic'\n\n";

## push
print "append elements with push:\n";
push(@food, "eggs");
print "'@food'\n\n";

## pop
print "remove the last element with pop:\n";
$rest = pop(@food);
print "rest = '$rest'\n";
print "food = '@food'\n\n";

print "READY.\n";
