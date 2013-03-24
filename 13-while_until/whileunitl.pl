#!/usr/bin/perl
##
## example with while, until works the same way reversed
##

print "enter foo:\n";

## readin user input
$var = <STDIN>;

## remove whitespaces
chop $var;

## check the input
while($var ne "foo"){
    print "sorry. Again? ";
    $var = <STDIN>;
    chop $var;
}

print "READY.\n";
