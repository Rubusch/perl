#!/usr/bin/perl
##
## hashing
##     process a hash:
##
##     while( $key, $value) = each (%hash){
##     }
##
##     lookup hash by element:
##     %by_value = reverse %by_key;
##     $key = $by_value{$value};
##
##

print "hashing demo\n";

## init
## access the single elements using "keys" and "elements": foreach $person (keys %ages)

my %ages = ("Michael Caine", 39,
	 "Dirty Den", 34,
	 "Angie", 27,
	 "Willy", "21 in dog years",
	 "The Queen Mum", 108);

## usage
print "Michael Caine - " . $ages{"Michael Caine"} . "\n";
print "Dirty Den - " . $ages{"Dirty Den"} . "\n";
print "Angie - " . $ages{"Angie"} . "\n";
print "Willy - " . $ages{"Willy"} . "\n";
print "The Queen Mum - " . $ages{"The Queen Mum"} . "\n";

## check element exists?
my $person = "Michael Caine";

print "Facebook knows '$person' ";
if (defined $ages{$person}) {
    print "exists: - '" . (defined $ages{$person}) . "' (true)";
} else {
    print "does not exist, remove account";
}
print "\n\n";

$person = "Lothar Rubusch";
print "Facebook knows '$person' ";
if (defined $ages{$person}) {
    print "exists: - '" . (defined $ages{$person}) . "' (true)";
} else {
    print "does not exist, remove account";
}
print "\n\n";

## check if key substring is contained
my $substring = "Michael";

my $matching_key = (grep { $_ =~ /^$substring/ } keys %ages)[0];
print "substring = '$substring', matching_key = '$matching_key' - Google knows: '$substring' is '";
if (defined $ages{$matching_key}) {
    print ($ages{$matching_key}) . " years old.'";
} else {
    print "forever young!";
}
print "\n\n";

my $substring = "Lothar";

$matching_key = (grep { $_ =~ /^$substring/ } keys %ages)[0];
print "substring = '$substring', matching_key = '$matching_key' - Google knows: '$substring' is '";
if (defined $ages{$matching_key}) {
    print ($ages{$matching_key}) . " years old.'";
} else {
    print "forever young!";
}
print "\n\n";


## transform the associative array into an array
my @info = %ages;
print "\@info:\n\t@info\n";
print "\$info[5]:\n\t$info[5]\n\n";

%moreages = @info;
## moreages is an associative array - it is the same as %ages

print "READY.\n";
