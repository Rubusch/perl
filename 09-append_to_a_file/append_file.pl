#!/usr/bin/perl
##
## append to a file
##

print "append something to a file's content\n";

$file = './test.txt';
open(INFO, ">>$file"); ## append
print INFO "beltrano\ncicrano\n";
close(INFO);

print "READY.\n";

