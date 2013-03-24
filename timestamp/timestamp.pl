#!/usr/bin/perl
##
## reset the timestamp of a given file to the timestamp of ./orig.txt
##
## doesn't work on all file systems!!!
##


## check entry
if(@ARGV != 1){
    die "usage: cptimes <filename to reset timestamp>\n";
}

## check files
my $orig = "./orig.txt";
my $reset = shift;
foreach $filename ($reset, $orig){
    &checkfile($filename);
}

## set timestamp of reset.txt to timestamp of orig.txt
use File::stat;

## get time attributes
my ($atime, $mtime) = (stat($orig))[8,9];

## print out timestamp of orig.txt
printf "file \"%s\" has atime: %s, and mtime: %s\n", $orig, scalar localtime($atime), scalar localtime($mtime); 

## reset timestamp of $reset
utime $atime, $mtime, $reset;

### subs
sub checkfile
{
    my $filename = shift;
    if((!-e $filename) 
       || (!-r $filename)
       || (!-w $filename)){
        die "file sucks!\n";
    }
}

print "READY.\n";
