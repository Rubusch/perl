#!/usr/bin/perl
##
## test of namespace in perl subfunctions
##
## - perl is PASS-BY-VALUE, for PASS-BY-REFERENCE use globals
## - perl unlike to bash(!) DOES HAVE separation between global and local
##   scope of a variable!!

use strict; 
use warnings;

my $var="FULANO";
our $globalvar="CICRANO";

## funcs

sub change
{
    print "var in sub before: $var\n";
    print "globalvar in sub before: $globalvar\n";

    $var = "BELTRANO";
    $globalvar = "BELTRANO";
    my $param = shift;
    my $ret = "BELTRANO";

    print "var in sub: $var\n";
    print "globalvar in sub: $globalvar\n";
    print "param in sub received: $param; set to " . ($param = "BELTRANO") . "\n";
    print "ret in sub: $ret\n";
    print "\n";
    return $ret;
}


## start
# a variable defined here is not seen as "global", use strict complains about violating this!
my $param="FULANO";
my $ret="FULANO";
print "var before: $var\n";
print "globalvar before: $globalvar\n";
print "param before: $param\n";
print "ret before: $ret\n";
print "\n";

$ret = &change($param);

## unlike on bash(!) the local modification does NOT persist!
print "var after: $var\n";
print "globalvar after: $globalvar\n";
print "param after: $param\n";
print "ret after, received: $ret\n";
print "\n";

print "READY.\n";
__END__
