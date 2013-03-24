#!/usr/bin/perl
##
## filecheck
##
# if necessary: /home/user or ~ is $ENV{HOME}

## check entry
if(@ARGV != 1){
    print "Usage:\t$0 <filename>\nFailed!\n";
    exit 0;
}
$filename = $ARGV[0];



## file exists?
if(-e $filename){
    print "file exists\n";
}else{
    print "file doesn't exist\n";
}


## file is a directory?
if(-d $filename){
    print "file is a directory\n";
}else{
    print "file is not a directory\n";
}



## readable?
if(-r $filename){
    print "file is readable\n";
}else{
    print "file isn't readable\n";
}

## writeable?
if(-w $filename){
    print "file is writeable\n";
}else{
    print "file is not writeable\n";
}

## executable?
if(-x $filename){
    print "file is executable\n";
}else{
    print "file is not executale\n";
}



## text file?
if(-T $filename){
    print "file is a text file\n";
}else{
    print "file is not a text file\n";
}

## binary file?
if(-B $filename){
    print "file is a binary file\n";
}else{
    print "file is not a binary file\n";
}



## multiple tests:
print "now multiple test in one:\n";
if( (-e $filename) && (-w $filename)){
    print "file exists and is writeable\n";
}else{
    print "file doesn't exist or is not writeable\n";
}



## use to check in scripts:
print "now the check:\n";
if( (!-e $filename) || (!-r $filename) || (!-w $filename)){
    print "the specified file \"$filename\" doesn't exist or either isn't readable, or isn't writeable.\n";
}else{
    print "the file is ok!\n";
}

print "READY.\n";

