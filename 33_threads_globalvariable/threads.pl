#!/usr/bin/perl
use strict;
use warnings;
use threads;
use threads::shared;


## $| if not 0, flush after each print
$| = 1;


my ($global):shared;
my (@threads);

push(@threads, threads->new(\&thr_sub, 1));
push(@threads, threads->new(\&thr_sub, 2));
push(@threads, threads->new(\&thr_sub, 3));

my $cnt = 0;
foreach my $thr (@threads){
    my @res = $thr->join;
    print "Thread (" . ($cnt+1) . ") returned: @res\n";
    ++$cnt;
}

print "READY.\n";





sub thr_sub
{
    my ($thr_id) = @_;

    for(0..10){
        ++$global;
        print "Thread ($thr_id): $_ - global: $global\n";
        sleep(1);
    }

    return ($thr_id);
}


