#!/usr/bin/perl
##
## linenumbers, uses 0's for leading zeros
##

$file = "./test.txt";
open(INFO, "<$file");

# setting the linefeed variable
$/ = "\n";

# set up index to count only lines with text, $. counts every line
$idx = 0;
while($line = <INFO>){
    # incase of empty line, do "next"
    ($line eq $/) ? next : ++$idx;
    printf("%03.d %s", $idx, $line);
}
close(INFO);

print "READY.\n";

