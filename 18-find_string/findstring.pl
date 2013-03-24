#!/usr/bin/perl
##
## finds a string and prints the text in parenthesis
##
## demonstrates working with the $_ variable for the current read line from a file
##

$file = "./test.txt";
$pattern = "ill";

print "--- reading ---\n";
open(INFO, $file);

print "--- replacing ---\n";
while($_ = <INFO>){
## replace every first occurance of $pattern with a parenthesized $pattern
#    s/${pattern}/(${pattern})/;

## do the same as global substitution (more than one occurances per line)
    s/${pattern}/(${pattern})/g;

## do the same case-insensitive
#    s/${pattern}/(${pattern})/gi;

    print $_;
}
close(INFO);

print "READY.\n";
