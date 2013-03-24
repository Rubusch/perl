#!/usr/bin/perl -w
use strict;
##
## prints time
##
## gmtime testing grounds!
##

print gmtime . "\n\n";

## my timer
my $hours = 12;
my $minutes = 45;

my @time;
while(($time[2] < $hours) || ($time[1] < $minutes)){
    @time = localtime; # gmtime

## do some output
    print "$time[2]:$time[1]:$time[0]\n"; 
}

print "READY.\n";
