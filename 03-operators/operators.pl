#!/usr/bin/perl
##
## variable operations
##

##
print "variable assignments\n\n";

##
print "add:\n";
$var = 1 + 2;
print "$var == 1 + 2;\n\n";

##
print "subtract:\n";
$var = 3 - 4;
print "$var == 3 - 4;\n\n";

## 
print "multiply:\n";
$var = 5 * 6;
print "$var == 5 * 6;\n\n";

## 
print "divide:\n";
$var = 7 / 8; 
print "$var == 7 / 8;\n\n";

##
print "nine to the power of 10:\n";
$var = 9 ** 10;
print "$var == 9 ** 10;\n\n";

##
print "modulo:\n";
$var = 5 % 2;
print "$var == 5 % 2;\n\n";

## 
print "increment:\n";
$tmp = $var;
++$var;
print "$var == ++$tmp\n\n"; ## operator has no effect within the "

##
print "decrement:\n";
$tmp = $var;
--$var;
print "$var == --$tmp\n\n";

## concatenation
print "concatenation:\n";
$str1 = "foo";
$str2 = "bar";
$var = $str1 . $str2;
print "$var == $str1 . $str2;\n\n";

## repeat
print "repeat:\n";
$var = $str1 x 7;
print "$var == $str1 x 7\n\n";

print "READY.\n";
