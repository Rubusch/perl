#!/usr/bin/perl -w
##
## sets '#' in front of each line
##

$file = './test.txt';
open(INFO, "<$file");
@lines = <INFO>;
close(INFO);


open(INFO, ">$file");
print INFO "# "; ## first "#"
close(INFO);



open(INFO, ">>$file");

## replace the list separator (usually a ' ') by '# '
$" = '# ';

## print the line with the new separator (use " )!!
print INFO "@lines";
close(INFO);

print "READY.\n";

