#!/usr/bin/perl
##
## count lines which contain the following regex pattern
##

$file="./test.txt";
open(INFO, "<$file");
$letter_x = 0;
$string_pattern = 0;
$string_pattern_caseinsensitive = 0;
$word_pattern_caseinsensitive = 0;

print "\n--- Reading ---\n";

while($line = <INFO>){

## match single letter 'i'
    if($line =~ /i/){
	++$letter_x;
	printf("letter x %03.d:\t\t\t\t%s\n", $letter_x, $line);
    }

## match pattern 'up'
    if($line =~ /up/){
	++$string_pattern;
	printf("string pattern %03.d:\t\t\t%s\n", $string_pattern, $line);
    }

## match pattern (several possibilities), here 'up' or 'Up'
#    if($line =~ /[Uu]p/){
    if($line =~ /(U|u)p/){
	++$string_pattern_caseinsensitive;
	printf("string pattern case insensitive %03.d:\t%s\n", $string_pattern_caseinsensitive, $line);
    }

## match pattern (several possibilities), here pattern 'up ' or 'Up ' within a word
    if($line =~ / *[Uu]p */){
	++$word_pattern_caseinsensitive;
	printf("word pattern case insensitive %03.d:\t%s\n", $word_pattern_caseinsensitive, $line);
    }
}
close(INFO);

print "--- Results ---\n";
print "letter \'x\': " . $letter_x . "\n";
print "string \'pattern\': " . $string_pattern . "\n";
print "string \'pattern\' (case-insensitive): " . $string_pattern_caseinsensitive . "\n";
print "word \'pattern\' (case-insensitive): ". $word_pattern_caseinsensitive . "\n";

print "\n";
print "READY.\n";
