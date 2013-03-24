#!/usr/bin/perl
##
## takes an argv, searches for that pattern in the text
## and puts it in parathesis
##

## include guard simple..
if(@ARGV != 1){
    exit 0;
}

## replacement
$pattern = $ARGV[0];
$file = "./test.txt";
open(INFO, $file);
while($_ = <INFO>){
    s/${pattern}/(${pattern})/;
    print $_;
}

close(INFO);

print "READY.\n";
