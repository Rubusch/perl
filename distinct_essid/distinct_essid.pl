#!/usr/bin/perl
use strict;
use warnings;
## prints all "distinct" essid names, in iwlist scan output

die "usage: $0 <iface>\n" if @ARGV != 1; 
my $iface = shift; 

## command
my @output = `iwlist $iface scan` or die $!;

## get essids
my @essids;
foreach (@output){
    my ($temp) = $_ =~ /.*ESSID:\"(.*)\"/x;
    push @essids, $temp if $temp;
}

## distinct
my %seen;
$seen{$_}++ for @essids;
my @single = grep{ $seen{$_} == 1 }keys %seen;
print $_, "\n" for @single;


