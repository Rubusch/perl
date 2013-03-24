#!/usr/bin/perl
##
## for example
##
##
## numerical test
## $a == $b   # equal
## $a != $b   # not equal
##
##
## string test
## $a eq $b   # equal
## $a ne $b   # not equal
##
##
## logical test
## $a && $b   # logical AND
## $a || $b   # logical OR
## !($a)      # logical NOT

print "test the for loop\n";

@food = ("apple", "pineapple", "banana");
for($idx=0; $food[$idx]; ++$idx){
    print $food[$idx] . "\n";
    print "yum, yum\n";
}


print "\n\nother syntax...\n\n";
print $_,"\nyum, yum\n" for @food;


print "READY.\n";

## PS:
##   for($idx=0;; ++$idx){
## ..is a endless loop ;)
