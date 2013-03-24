#!/usr/bin/perl -w
use strict;
##
## finds textpassages in files and
## allows insert text into a file
##

use File::Copy;


################################################################################################

## text to search for
my $text_old = "Up got Jack, xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx";

## text to set
my $text_new = "Up got Jack, and home did trot";

################################################################################################


## errorexit() & usage()
##
sub errorexit($)
{
    print STDERR $_[0], "\n";
}
sub usage
{
    errorexit "Usage:\n $0 <file to be patched>\nor\n $0 <file to be patched> restore\n";
    exit 1
}


## check filename
##
## @param
##   $filename
sub file_checkaccess
{
    my $filename = shift;
    if(!-e $filename){ die "check filename...failed.\n\"$filename\" doesn't exist.\n"; }
    if(!-r $filename){ die "check filename...failed.\n\"$filename\" isn't readable.\n"; }
    if(!-w $filename){ die "check filename...failed.\n\"$filename\" isn't writeable.\n"; }
    print "check filename...ok.\n";
}


## restore the backups
## 
## @param
##   $filename of the backup-ed file (w/o ".orig")
sub file_restore
{
    my $filename = shift;
    if(-e $filename){ &file_checkaccess($filename); }

    my $backup_filename = $filename . ".orig";
    &file_checkaccess($backup_filename);

    print "recopy .orig file...";
    copy($backup_filename, $filename) or die "restoreing backup...failed.\n";
    print "ok.\n";

    print "remove .orig file...";
    unlink($backup_filename) or die "removing ${backup_filename}...failed.\n";
    print "ok.\n";
}


## backup a file
##
## @param
##   $filename of the file to backup
sub file_backup
{
    my $filename = shift;

    &file_checkaccess($filename);
    if(-e $filename . ".orig"){ &file_checkaccess($filename . ".orig"); }
    
    copy($filename, $filename . ".orig") or die "file_backup...failed.\nBackup $filename didn't work!\n";
    print "file_backup...ok.\n";
}


## flashes and reads the input from the STDIN stream
##
## returns the user input
sub getuserinput
{
    $| = 1;
    $_ = <STDIN>;
    chomp;
    return $_;
}


## read section out of orig and patch file or search for other section
##   $file - file to modify
##   $orig - original text
##   $new  - new text
##
sub pimpmyfile
{
    my $filename = shift;
    my $text_orig = shift;
    my $text_new = shift;
    
    my $filename_orig = $filename . ".orig";

    open(READ, "<$filename_orig");
    open(WRITE, ">$filename");
    while(<READ>){
	chomp;

	## replace section
	s/^${text_orig}$/${text_new}/g;

	## write to file
	print WRITE $_ . "\n";
    }
    close(READ);
    close(WRITE);
}


##
##
## start program
##
##


print "$0\n\n(C) by Lothar Rubusch\n\n *** checks ***\n";

## check command line arguments
usage unless scalar ($#ARGV == 0) || ($#ARGV == 1);
my $filename_target = $ARGV[0];

my $is_restore = 0;
if(($#ARGV == 1) && ($ARGV[1] eq "restore")){
    $is_restore = 1;
}

## backup or restore
if($is_restore){
    ## restore
    &file_restore($filename_target);

}else{
    ## backup 
    &file_backup($filename_target);

    ## get and insert text section
    &pimpmyfile($filename_target, $text_old, $text_new);
}

print "READY.\n";
