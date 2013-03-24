#!/usr/bin/perl -w
use strict;
##
## takes out the first text sequence included by a "start" 
## (inclusive) stop "stop" (exclusive) sequence.
## writes the text into a file named "result.txt"

use File::Copy;



## check filename
##
## @param: 
##    $filename
sub checkfilename
{
    my $filename = shift;
    if(!-e $filename){ die "check filename...failed.\nFile \"$filename\" doesn't exist.\n"; }
    if(!-r $filename){ die "check filename...failed.\nFile \"$filename\" isn't readable.\n"; }
    if(!-w $filename){ die "check filename...failed.\nFile \"$filename\" isn't writeable.\n"; }
    print "check filename...ok.\n";
}


## "record" a paragraph and save it, section id starts with 1
##
## param;
##    $source
##    $dest
##    $section
sub takeout
{
    my $source = shift;
    my $dest = shift;
    my $section = shift;

    ## record flag -> TODO: improve(?)
    my $record = 0;
    my $section_count = 0;

    print "opening files (\"$source\" and \"$dest\") in order to find text sequence\n\n";
    open(READ, "<$source");
#    open(WRITE, ">$dest");
    while(<READ>){
	chomp;
	
	## count diff's
	if(/^diff.*/){ 

	}

	## "start" recording - controlling reading or not
	if( /^diff.*/ ){
	    ++$section_count;
	    if( $section_count == $section ){ 
		## start
		$record = 1;
		print "************************************ START ************************************\n";
		next;
	    }elsif( $section_count == $section + 1 && ($record == 1)){
		## stop
		print "************************************  END  ************************************\n";
		$record = 0;
		next;
	    }else{
		## skip
		next;
	    }	    
	}

	## record or stop - turn on/off the necessary sections
	if($record){
	    print "$. "; ###
	    if(/^\+\+\+.*/ | /^---.*/ | /^@@.*/){ # OK
		print "TEXT:\t" .  $_;

	    }elsif(/^\+.*/){ # OK
		s/^\+//;
		print "ADD:\t" . $_;

	    }elsif(/^-.*/){ # TODO: check
		s/^-//;
		print "REMOVE:\t" . $_;

	    }else{
		print "SEARCH:\t" . $_;
	    }

	    ## set linefeed
	    if(!/.*\n$/ | !/.*\r$/){
		print "\n";
	    }
	}

    }
    
    ## last line in file
    if($record == 1){
	print "************************************  END  ************************************\n";
    }

#    close(WRITE);
    close(READ);

    print "done.\n";
}


###
### main
###


## checks 
print "$0\n";

## check for exactly one argument (=filename)!
if($#ARGV != 0){ die "check arguments...failed\nUsage:\n $0 <filename>\n"; }
print "check arguments...ok.\n";

## check if the filename is valid
my $filename = $ARGV[0];
&checkfilename($filename);

## cut out parts of the desired file
&takeout($filename, "result.txt", 5);

print "READY.\n";
exit;

