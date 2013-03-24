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

## recursive way!
## TODO: iterative way!!!
## TODO: use threading!!
## init
our @result; our @result_idx;
for(my $idx=0; $idx<$pattern_len; ++$idx){
    push(@result, $ressource[0]);
    push(@result_idx, 0);
}

## iterator variable
my $digit = $#result_idx;
my $filename_out = 'wordbook.txt';
open(INFO, ">$filename_out");

while(1){
    last if &permutate($digit);

## write to file
    print INFO $_ for @result; print INFO "\n";
}
close(INFO);

print "READY.\n";





## doubles allowed!
sub permutate(){
    my $digit = shift;
    my $chr_idx = $result_idx[$digit];

    ++$chr_idx;
    if($chr_idx > $#ressource){
        return -1 if 0 == $digit;

        ## zero
        $chr_idx = 0;
        $result_idx[$digit] = $chr_idx;
        $result[$digit] = $ressource[$result_idx[$digit]];
        
        ## next digit
        --$digit;
        
        # recursion
        return &permutate($digit);
        
    }else{
        $result_idx[$digit] = $chr_idx;
        $result[$digit] = $ressource[$result_idx[$digit]];
    }

    return 0;
}





