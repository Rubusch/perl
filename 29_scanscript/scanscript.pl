#!/usr/bin/perl
## iface - wireless interface name e.g. ath0
## essid - ESSID of the AP to scan for
## nscans - number of scans to perform 
##
use strict;
use warnings;

die "usage: $0 <iface> <essid> <#scans>\n" if @ARGV != 3;
my $iface = shift; my $essid = shift; my $nscans = shift;
my $ndetects=0; my $siglev_sum=0;

## scans
for( my $found = 0, my $timestart=time; 0 < $nscans; --$nscans){
#    my @output = `iwlist $iface scanning` or die $!;
### TODO uncomment above, remove below XXX
    my $file = './raw.txt';
    open(INFO, "<$file") or die $!;
    my @output = <INFO>;
    close(INFO);
###

    # list cells
    my @cells;
    for(my $i=0; local $_ = shift @output; $cells[$i] .= $_){
        ++$i if /^ *Cell \d\d - .*/;
    }

    # evaluate
    foreach (@cells){
        my $tmp_essid;
        if((($tmp_essid) = $_ =~ /.*ESSID:\"(.*)\"/x) && ($essid eq $tmp_essid)){
            (my $freq) = $_ =~ /.*Frequency:(\d\.\d{1,3}|\d+)\ GHz.*/x;
            if(!$freq){ next; }

            (my $siglev) = $_ =~ /.*Signal\ level=-(\d{1,4})\ dBm.*/x;
            if(!$siglev){ next; }

            ++$ndetects;
            $siglev_sum += $siglev;

            print "*********************\n";
            print "ESSID: $essid  Freq: $freq\n";
            print "Successful scans performed: $ndetects\n";
            print "Running Time: " . (time - $timestart) . " secs\n";
            print "Latest signal level: -$siglev dBm\n";
            print "Average signal level: -" . ($siglev_sum / $ndetects) . " dBm\n";

            sleep 2;
            $found = 1;
        }
    }

    ($found)? $found = 0 : print "AP\/ESSID not found\n";    
    print "\n";
}

#final
print "Overall Average:\nAverage signal level: -" . ($siglev_sum / $ndetects) . " dBm\n" if $ndetects > 0;
