#!/usr/bin/perl
use strict;
use warnings;
use threads;

## generates permutations of a given set of elements

die "usage: $0 <inputfile> <ndigits>\n" if @ARGV != 2;
my $filename_in = "./" . shift; 
our $pattern_len = shift;

## read elements from file into a list
open(INFO, "<$filename_in") or die $!;
my @input = <INFO>; die "File empty!\n" if !@input;
close(INFO);

## read out characters into global variable
our @pool = split(//, (join "\n", @input));

## prepare character pool
my %seen; 
$seen{$_}++ for @pool;
delete $seen{"\n"};
@pool = keys %seen;

## threads
my (@threads);
for(my $idx=0; $idx <= $#pool; ++$idx){
    push(@threads, threads->new(\&thr_writebook, $idx));
}

## separate - after every single thread started, 
## let the main thread wait on them 
foreach my $thr (@threads){
    $thr->join;
}

print "READY.\n";






sub thr_writebook
{
## TODO check algorithm
## @pool, $pattern_len are "our"
    
    my $leading_idx = shift;
    my $filename_out = "wordbook_" . $leading_idx . ".txt";
    
## init result list< pair >
    my (@result_chr, @result_idx);
    for(my $idx=0; $idx < $pattern_len; ++$idx){
        push(@result_chr, $pool[0]);
        push(@result_idx, 0);
    }

## generate and write to file
    open(INFO, ">$filename_out");
    ## leading character depends on thread
    $result_chr[0] = $pool[$leading_idx];

    ## set the remaining characteres
    my $done=0;
    while(!$done){
        print INFO $_ for @result_chr; print INFO "\n";

        for(my $digit=$#result_idx; 0<$digit; --$digit){
            ++$result_idx[$digit];
            
            if($result_idx[$digit] > $#pool){
                if(1 == $digit){
                    $done=1;
                    last;
                }

                $result_idx[$digit]=0;
                $result_chr[$digit]=$pool[$result_idx[$digit]];
                
            }else{
                $result_chr[$digit]=$pool[$result_idx[$digit]];
                last;
            }
        }
    }
    close(INFO);
}

