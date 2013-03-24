#!/usr/bin/perl
##
## demonstrates the creation of a subfunction
##
##
## pass of parameters:
##
##  call: 
##    &func($asdf);
##
##  code:
##    sub func
##    {
##      my $var = $_;
##      ...
##    or
##      my $var = shift; 
##      ...
##
##
##  call: 
##    &func(@list);
##
##  code:
##    sub func
##    {
##      my @list = @_;
##      ...
##
##  call:
##    @list = (\@list, \%hash);
##    &func(@list);
##
##  code:
##    sub func
##    {
##      my(@list, %hash) = @_;
##      ...
##
##


sub mysubroutine
{
    print "\tnot a very interesting routine\n";
    print "\tthis does the same thing every time\n";
}

#########################################################

print "subfunction demo\n";


print "call it without parameter:\n";
&mysubroutine;

print "call it with a parameter:\n";
&mysubroutine($_);

print "call it with two parameters:\n";
&mysubroutine(1+2, $_);


print "READY.\n";
