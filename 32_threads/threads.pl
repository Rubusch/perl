#!/usr/bin/perl
use strict;
use warnings;
use threads;
#use threads::shared;

my $fd_thr_a = threads->new(\&thr_a);
$fd_thr_a->detach;
my $fd_thr_b = threads->new(\&thr_b);
$fd_thr_b->detach;

sleep 5;
## when the main thread terminates, all threads terminate!
print "Main - READY.\n";



sub thr_a
{
    while(1){
        print "Thread A - Hello!\n";
        sleep 1;
    }
    print "Thread A - done\n"; # never executed
}


sub thr_b
{
    while(1){
        print "Thread B - Hello!\n";
        sleep 1;
    }
    print "Thread B - done\n"; # never executed
}
