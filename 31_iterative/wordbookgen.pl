#!/usr/bin/perl
use strict;
use warnings;
## generates permutations of a given set of elements

die "usage: $0 <inputfile> <ndigits>\n" if @ARGV != 2;
my $filename_in = "./" . shift; 
our $pattern_len = shift;

## read elements from file into a list
open(INFO, "<$filename_in") or die $!;
my @input = <INFO>; die "File empty!\n" if !@input;
close(INFO);

## read out characters
our @ressource = split(//, (join "\n", @input));

## prepare
my %seen; 
$seen{$_}++ for @ressource;
delete $seen{"\n"};
@ressource = keys %seen;

## result data structure
my (@result_chr, @result_idx);
for(my $idx=0; $idx<$pattern_len; ++$idx){
    push(@result_chr, $ressource[0]);
    push(@result_idx, 0);
}

## iterative
my $filename_out = 'wordbook.txt';
open(INFO, ">$filename_out");
my $done=0;
while(!$done){
    print INFO $_ for @result_chr; print INFO "\n";

    for(my $digit=$#result_idx; 0<=$digit; --$digit){
        ++$result_idx[$digit];

        if($result_idx[$digit] > $#ressource){
            if(0 == $digit){                
                $done=1;
                last;
            }

            $result_idx[$digit]=0;
            $result_chr[$digit]=$ressource[$result_idx[$digit]];

        }else{
            $result_chr[$digit]=$ressource[$result_idx[$digit]];
            last;
        }
    }
}
close(INFO);

print "READY.\n";





