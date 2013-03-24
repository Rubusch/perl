#!/usr/bin/perl
##
## reads in a text and counts the linenumber
##

$file = "./test.txt";
open(INFO, "<$file");

while($line = <INFO>)
{
    printf("%03.d %s", $., $line);
}
close(INFO);

print "READY.\n";
