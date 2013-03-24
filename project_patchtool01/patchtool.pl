#!/usr/bin/perl -w
use strict;
## patchtool - Lothar Rubusch, 2008
##
## - does backups of the files to be modified, a "restore" restores the backups
## - cuts out sections of the patch by number
##
## -> the insert should be manual copy paste
##


use File::Copy;

## errorexit() & usage()
##
sub errorexit($)
{
    print STDERR $_[0], "\n";
}
sub usage
{
    errorexit "Usage:\n $0 <path to patch> parse\n\n...,or to backup the file(s):\n $0 <path to patch> backup\n\n...,or to restore the backuped file(s):\n $0 <path to patch> restore";
    exit 1
}


## check filename
##
## @param
##   $filename
sub checkfilename
{
    my $filename = shift;
    if(!-e $filename){ die "check filename...failed.\n\"$filename\" doesn't exist.\n"; }
    if(!-r $filename){ die "check filename...failed.\n\"$filename\" isn't readable.\n"; }
    if(!-w $filename){ die "check filename...failed.\n\"$filename\" isn't writeable.\n"; }
    print "check filename...ok.\n\n";
}


## get list of files
##
## @param
##   $patchname is the path to the patch
sub getfilenamelist
{
    my $source = shift;
    my @paths_tmp;
    my @paths;
    my $pwd = ".";

    open(READ, "<$source");
    while(<READ>){
	chomp;
	if(/^\-\-\-.*/){
	    s/^\-\-\-\s*//;
	    @paths_tmp = split(/\s+/, $_);
	    push(@paths, $pwd . "/" . $paths_tmp[0]);
	}
    }
    close(READ);

    return @paths;
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


## commands() for the "parse" case
##
sub commands
{
    print "\ncommands:\n";
    print "\tnext\t- next section\n";
    print "\tprev\t- previous section\n";
    print "\tprint\t- print content\n";
    print "\tquit\t- quit the proggy\n";
    print "\n";
}


## restore the backups
##
## @param
##   $filename of the backup-ed file (w/o ".orig")
sub restorefilename
{
    my $filename = shift;
    my $backup_filename = $filename . ".orig";

    if(-e $backup_filename){
	&checkfilename($backup_filename);

	print "recopy .orig file...";
	copy($backup_filename, $filename) or die "restoreing backup...failed.\n";
	print "ok.\n";

	print "remove .orig file...";
	unlink($backup_filename) or die "removing ${backup_filename}...failed.\n";
	print "ok.\n";
    }else{
	print "restore ${backup_filename}...failed.\n";
    }
}


## backup a file
##
## @param
##   $filename of the file to backup
sub backupfilename
{
    my $filename = shift;

    if(-e ($filename . ".orig")){
	&checkfilename($filename . ".orig");
    }
    if(-e $filename){
	&checkfilename($filename);
	copy($filename, $filename . ".orig") or die "${filename}...failed.\nBackup $filename didn't work!\n";
	print "backup ${filename}...ok.\n";
    }else{
	print "backup ${filename}...failed.\n";
    }
}


## functions
## "record" a paragraph and save it, section id starts with 1
##
## option: mask for content
## add (1), remove (2), context (4), comments (10)
## a sum is passed (0 - 17): 1, 2, 3, 4, 5, 6, 7
## and 11, 12, 13, 14, 15, 16, 17 are possible
##
## param;
##    $source
##    $section
##    $option
sub parsepatchsection
{
    ## params
    my $source = shift;
    my $section = shift;
    my $option = shift;

    ## internals
    my $record = 0;
    my $cnt_section = 0;
    my $dest;

    ## options
    my $opt_sav = 0; # 20
    my $opt_com = 0; # 10
    my $opt_els = 0; # 4
    my $opt_rem = 0; # 2
    my $opt_add = 0; # 1

    ## option
    if(20 < $option){
	$opt_sav = 1;
	$option = $option - 20;
    }
    if(10 < $option){
	$opt_com = 1;
	$option = $option - 10;
    }
    if(4 <= $option){
	$opt_els = 1;
	$option = $option - 4;
    }
    if(2 <= $option){
	$opt_rem = 1;
	$option = $option - 2;
    }
    if(1 <= $option){
	$opt_add = 1;
	$option = $option - 1;
    }

    ## write
    if($opt_sav){
	$dest = "patch.section_" . $section . ".txt";
	open(WRITE, ">$dest");
    }

    ## read
    open(READ, "<$source");
    while(<READ>){
	chomp;

	## "start", "stop" recording - controlling reading or not
	if( /^diff.*/ ){
	    ++$cnt_section;
	    if( $cnt_section == $section ){
		## start
		print "************************************ START ************************************\n";
		$record = 1;
		next;
	    }elsif( $cnt_section == $section + 1 && ($record == 1)){
		## stop
		print "************************************* STOP ************************************\n";
		$record = 2;
		next;
	    }else{
		## skip
		next;
	    }
	}

	## print linenumbers
	if(1 == $record){
	    if($opt_com){
		if($opt_sav){
		    print WRITE "$. ";
		}else{
		    print "$. ";
		}
	    }

	    ## catch Text: "+++ " and "--- "
	    if(/^\+\+\+.*/ | /^---.*/ | /^@@.*/){
		if($opt_els){
		    if($opt_sav){
			if($opt_com){ print WRITE "TEXT:\t"; }
			print WRITE $_;
		    }else{
			if($opt_com){ print "TEXT:\t"; }
			print $_;
		    }
		}

	    ## catch Add: "+"
	    }elsif(/^\+/){
		if($opt_add){
		    s/^\+//;
		    if($opt_sav){
			if($opt_com){ print WRITE "ADD:\t"; }
			print WRITE $_;
		    }else{
			if($opt_com){ print "ADD:\t"; }
			print $_;
		    }
		}

	    ## catch Remove: "-"
	    }elsif(/^-.*/){
		if($opt_rem){
		    s/^-//;
		    if($opt_sav){
			if($opt_com){ print WRITE "REMOVE:\t"; }
			print WRITE $_;
		    }else{
			if($opt_com){ print "REMOVE:\t"; }
			print $_;
		    }
		}

	    ## catch Rest
	    }else{
		if($opt_els){
		    if($opt_sav){
			if($opt_com){ print WRITE "TEXT:\t"; }
			print WRITE $_;
		    }else{
			if($opt_com){ print "TEXT:\t"; }
			print $_;
		    }
		}
	    }

	    ## append a linefeed
	    if(!/.*\n$/ | !/.*\r$/){
		if($opt_sav){
		    print WRITE "\n";
		}else{
		    print "\n";
		}
	    }
	}
    }

    ## last line in file
    if($record == 1){
	print "************************************  END  ************************************\n";
	$record = 2;
    }

    ## if empty
    if($record == 0){
	print "\nThis section is empty!!!\n";
    }

    close(READ);
    close(WRITE);
}



#######################################################################################################
##
## start proggy
##
#######################################################################################################



print "$0\n\n(C) by Lothar Rubusch\n\n *** checks ***\n";
usage unless scalar @ARGV == 2;
my $patchname = $ARGV[0];
my $command = $ARGV[1];

## read out list of filenames
&checkfilename($patchname);
my @filenamelist = &getfilenamelist($patchname);


## in case restore the .orig files
if($command eq "restore"){
    print "\n *** restoring backup(s) ***\n";
#    foreach my $name (@filenamelist){ &checkfilename($name); }
    foreach my $name (@filenamelist){ &restorefilename($name); }

}elsif($command eq "parse"){
    print "\n *** parsing patch file ***\n";
    my $option;
    my $section = 1;
    my $opt_parse = 17;
    &commands();

    while(1){
	print "${section}. section. Enter a command:\n> ";

	# read user input - option
	$option = &getuserinput();

	## next
	if($option eq "next"){
	    print "next: ";
	    ++$section;
	    print "${section}. section\n";
	    print "\n";
	    next;

	## prev
	}elsif($option eq "prev"){
	    print "prev: ";
	    if(1 < $section){
		--$section;
		print "${section}. section\n";
	    }else{
		print "1. section is minimum!\n";
	    }
	    print "\n";
	    next;

	## print
	}elsif($option =~ /^(print).*$/){
	    print "print...\n";

	    ## e.g "print 17"
	    if($option =~ /^(print)\s+[123]?[1234567]$/ ){
		my @tmp = split(/\s+/, $_);
		$opt_parse = $tmp[1];
		&parsepatchsection($patchname, $section, $opt_parse);

	    ## print only -> ask for the presentation mode
	    }else{
		my $ask = 0;
		do{
		    ## ask for the mode
		    print "Type in the printmode, \"cancel\" or \"help\"\nCurrent mode: $opt_parse > ";
		    $_ = &getuserinput();

		    ## evaluate the input
		    if(/^\s*$/){
			&parsepatchsection($patchname, $section, $opt_parse);
			$ask = 0;

		    }elsif( $_ =~ /^[123]?[1234567]$/ ){
			$opt_parse = $_;
			&parsepatchsection($patchname, $section, $opt_parse);
			$ask = 0;

		    }elsif($_ eq "cancel"){
			$ask = 0;

		    }else{
			print "\tprint help:\n";
			print "\t\t1  - lines to add\n";
			print "\t\t2  - lines to remove\n";
			print "\t\t4  - text and context\n";
			print "\t\t10 - linenumbers and comments\n\n";
			print "\t\t20 - save to disk, the section will be saved under the selected options\n";
			print "\t\tsum up the values and enter, or \"cancel\"\n";
			$ask = 1;
		    }
		    print "\n";
		}while($ask);
	    }
	    print "done.\n\n";
	    next;

	## quit
	}elsif($option eq "quit"){
	    print "quit...\n\n";
	    last;

	}else{ &commands(); }
    }

}elsif($command eq "backup"){
    print " *** backing up files ***\n";
#    foreach my $name (@filenamelist){
#	&checkfilename($name);
#	foreach $name (@filenamelist){
#	    my $filename = $name . ".orig";
#	    if(-e $filename){ &checkfilename($filename); }
#	}
#    }
    foreach my $name (@filenamelist){ &backupfilename($name); }

}else{
    print "What's that?\n";
}

print "READY.\n";
