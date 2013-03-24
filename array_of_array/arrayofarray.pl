#!/usr/bin/perl
use strict;
use warnings;

sub something
{
    my ($ref) = @_;

    print "looped..\n";
    print $_,"\n" for @{$ref};

    print "stringwise: \'${$ref}[0]', \'${$ref}[1]\' and \'${$ref}[2]\'\n";
## this doesn't work:
#my $a=shift; my $b=shift; my $c=shift; print "single: \'$a\', \'$b\' and \'$c\'\n";
    print "\n";
}

print "a one dimensional reflist\n";
my @reflist = ["a", "b", "c"];
&something( @reflist );

print "a two dimensional reflist\n";
my @list_of_reflist; my $BUU="buu"; my $DIE="da";
push @list_of_reflist, [ "foo", "faa", "fee" ];
push @list_of_reflist, [ "boo", "bii", $BUU ];
push @list_of_reflist, [ "dee", "daa", $DIE ];

## reference elements and pass as sub param
&something( @list_of_reflist[1] );

## reference single elements
print "test first element: \'${$list_of_reflist[0]}[0]\'\n\n";

## pop element
my ($tmp) = pop @list_of_reflist;
print "pop element = '@{$tmp}'\n";

print "READY.\n";
