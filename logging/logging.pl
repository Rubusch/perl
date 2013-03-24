#!/usr/bin/perl
##
## demonstrates a logging functionality
use strict;
use warnings;

## vars
my $logging = 1;

## funcs
sub logit
{
    return unless $logging;
    my $msg=shift;
    print $msg;
    print LOG $msg;
}

## start
`rm -f ./some.log`; # clean
if( $logging ){ open( LOG, ">> ./some.log"); }
&logit("Hello World!\n");
&logit(`ls -al`);
if( $logging ){ close( LOG ); }

