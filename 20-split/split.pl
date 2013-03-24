#!/usr/bin/perl
##
## demonstrates the split function
##

print "split demonstration:\n";

$info = "Caine:Michael:Actor:14, Leafy Drive";
print "$info\n";

print "--------------------------------------\n";

@personal = split(/:/, $info);
print "@personal\n";

print "READY.\n";

