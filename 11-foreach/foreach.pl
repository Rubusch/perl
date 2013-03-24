#!/usr/bin/perl
##
## foreach example
##

print "foreach example\n";

@food = ("apple", "pear", "grape", "banana");
foreach $morsel (@food){
    print "$morsel\n";
    print "yum, yum\n";
}

print "READY.\n";
