#!/usr/bin/perl
##
## demonstrates an array of hashes
##
use strict;
use warnings;

my %azul = (
    FOO => "azul foos secret",
    FII => "azul fiis secret",
    FAA => "azul faas secret"
);
#print "azul:\n" . %azul . "\n\n";
#print "azul{FOO}:\n\'$azul{'FOO'}\'\n\n";
#print "defined azul{FUU}:\n\'" . ( ( defined $azul{'FOO'} ) ? 1 : 0 ) . "\'\n\n";
#print "defined azul{FUU}:\n\'" . ( ( defined $azul{'FUU'} ) ? 1 : 0 ) . "\'\n\n";

my %verde = (
    FOO => "verde foos secret",
    BOO => "verde boos secret"
);
#print "verde:\n" . %verde . "\n\n";

my @monstros = ( \%verde, \%azul );
#print "monstros:\n@monstros\n\n";
# out: 'BOO verde boos secret FOO verde foos secret FII azul fiis secret FAA azul faas secret FOO azul foos secret'

# problem 1: 'BOO', but NOT 3/8 as it was for %azul, above
#print "monstros[0]:\n" . $monstros[0] . "\n\n";

# problem 2: "strict refs"
#no strict "refs";
print "monstros[0]{FOO}:\n\'" . $monstros[0]->{FOO} . "\'\n\n";
# out: Can't use string ("BOO") as a HASH ref while "strict refs" in use at ./arrayofhashes.pl line 32.

print "READY.\n";
