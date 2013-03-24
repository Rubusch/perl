#!/usr/bin/perl -w
use strict;
## 
## the backup mechanism
##
## do a backup foo.orig of the file meant to be modified
## at passing "undo" recopy the foo.orig file
##
## Usage:
## prgname filename        - backups the file to modify
## or
## prgname filename undo   - restores the backup
##


use File::Copy;


## check filename
##
## @param
##   $filename
sub checkfilename
{
    my $filename = shift;
    if(!-e $filename){ die "check filename...failed.\nFile \"$filename\" doesn't exist.\n"; }
    if(!-r $filename){ die "check filename...failed.\nFile \"$filename\" isn't readable.\n"; }
    if(!-w $filename){ die "check filename...failed.\nFile \"$filename\" isn't writeable.\n"; }
    print "check filename...ok.\n";
}


## restore the backups
## 
## @param
##   $filename of the backup-ed file (w/o ".orig")
sub undofilename
{
    my $filename = shift;
    my $backup_filename = $filename . ".orig";

    &checkfilename($backup_filename);

    print "recopy .orig file...";
    copy($backup_filename, $filename);
    print "ok.\n";

    print "remove .orig file...";
    unlink($backup_filename);
    print "ok.\n";
}


## backup a file
##
## @param
##   $filename of the file to backup
sub backupfilename
{
    my $filename = shift;
    
    copy($filename, $filename . ".orig") or die "backupfilename...failed.\nBackup $filename didn't work!\n";
    print "backupfilename...ok.\n";
}


## functions
## TODO: implementations


## checks
print "$0\n *** checks ***\n";
if($#ARGV < 0){ die "check argument...failed.\nUsage:\n $0 <filename>\nor\n $0 <filename> undo\nto restore the backuped file(s)\n"; }
print "check argument...ok.\n";

## in case restore the .orig files
my $filename = $ARGV[0];
if(($#ARGV == 1) && ("undo" eq $ARGV[1])){
    print " *** restoring backup ***\n";
    &undofilename($filename);
    exit; ## in case not necessary!!!
}else{
    &backupfilename($filename);
}

## check accessibility of the file to change
&checkfilename($filename);

## code
print "\ncode\ncode\ncode\ncode\ncode\ncode\ncode\n\n";

print "READY.\n";
