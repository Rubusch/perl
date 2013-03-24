#!/usr/bin/perl
##
## array assignemnt
##
use warnings;
use strict;


$var1 = "fulano";
$var2 = "beltrano";
print "$var1, $var2\n\n";


## init
print "assignment 1\n";
($var3, $var4) = ($var1, $var2);
print "$var1, $var2, $var3, $var4\n\n";


## do a list and add one element
@list = ($var1, $var2);
$var3 = "cicrano";
push(@list, $var3);

## split the list
print "split the list:\n";
($var3, @newlist) = @list;

print "1. $var3\n";
print "2. @newlist\n\n";

print "READY.\n";

