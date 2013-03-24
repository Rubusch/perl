#!/usr/bin/perl
##
## adapts an old cvs header to a new svn header
##
## note: shorter version for opening, joining, writing (but writing doesn't work out)
## my $file = $ARGV[0];
## my $content = do{ local (@ARGV,$/) = $file; <> };
##
use strict;
use warnings;


my $cvs_header = '##------------------------------------------------------------------------------
## Copyright FOOBAR Ltd\. \d+\s*-\s*\d+
## \$Header\$
##------------------------------------------------------------------------------
##';

my $svn_header = '##------------------------------------------------------------------------------
## $HeadURL$
## $Revision$
## $Date$
## $Author$
##------------------------------------------------------------------------------
## Copyright FOOBAR Ltd. 2004-2011
##------------------------------------------------------------------------------
##';

die "usage:\n> $0 <filename>\nor call recursively like:\n> find ./ -name \\*.ebuild -exec $0 {} \\;\n\n" if @ARGV == 0;

## open
open(INPUT, "<$ARGV[0]") or die $!;
my @input_array = <INPUT>;
close(INPUT);
my $input_scalar = join("",@input_array);

## search & replace
$input_scalar =~ s/$cvs_header/$svn_header/g;
## with \Q disables REGEX pattern
#$content =~ s/\Q$cvs_header/$svn_header/g;

## close
open(OUTPUT,">$ARGV[0]") or die $!;
print OUTPUT $input_scalar;
close(OUTPUT);

print "READY.\n";
