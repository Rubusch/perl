#!/usr/bin/perl
## function to print command and output of a shell command on screen, and return its result value
use strict;
use warnings;


sub exe
{
    return -1 unless my $cmd=shift;
    print "$cmd\n";
    print `$cmd`;
    return $?;
}


## execute test
&exe( "find . -exec file {} \\;" );
print "READY.\n";

