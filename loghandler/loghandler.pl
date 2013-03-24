#!/usr/bin/perl
##
## source: http://www.perl-community.de/bat/poard/thread/15639
## needs the loghandler.tgz installed as .pm module!
use strict;
use warnings;
use Log::Handler;

my $log = Log::Handler->new();

$log->add(
    screen => {
        maxlevel => "info",
    }
    );

$log->add(
    file => {
        filename => "some.log",
        mode     => "trunc", # setting trunc here, re-writes the logfile each time
        maxlevel => "info",
    }
    );

$log->info("Hello World!");
$log->info(`ls -al`);
$log->info($_) for `ls -al`;
print "READY.\n";

