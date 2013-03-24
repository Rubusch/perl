#!/usr/bin/perl
use strict;
use warnings;
#use v5.10; # say, alternatively
sub say { local $\ = "\n"; print @_ }

my @array = qw( fulano beltrano cicrano );
my $arraysize = 0;

## print array elements
print "array: '@array'\n";
print "\n\n";

print "print array size\n";
## implizit scalar conversion
$arraysize = @array;
print "\@array\t\t'$arraysize'\n";

## explizit scalar conversion
$arraysize = scalar (@array);
print "scalar \(\@array\)\t'$arraysize'\n";

## array length + 1
$arraysize = $#array + 1;
print "\@\#array\t\t'$arraysize'\n";
print "\n\n";

print "multidimensional arrays\n";
my @twodimarray = ( [ 1, 11, 111 ]
                    , [ 2, 22, 222, 2222 ]
                    , [ 3, 33, 333, 3333, 33333 ]
                    , [ 4, 44, 444, 4444, 44444, 444444 ] );

## lenght + 1 in first dim
$arraysize = $#twodimarray + 1;
print "size first dim: '$arraysize'\n";

## length + 1 in second dim
$arraysize = $#{$twodimarray[2]}+1;
print "size second dim: '$arraysize'\n";
print "\n\n";


## three dimensional
print "three dimensional array\n";
my @threedimarray = ( [
                          [ 1, 11 ],
                          [ 2, 22 ]
                      ], [
                          [ 1, 11, 111 ],
                          [ 2, 22, 222 ],
                          [ 3, 33, 333 ]
                      ], [
                          [ 1, 11, 111, 1111 ],
                          [ 2, 22, 222, 2222 ],
                          [ 3, 33, 333, 3333 ],
                          [ 4, 44, 444, 4444 ]
                      ]);

## lenght + 1 in first dim
$arraysize = $#threedimarray + 1;
print "size first dim: '$arraysize'\n";


## length + 1 in second dim
$arraysize = $#{$threedimarray[2]} + 1;
print "size second dim: '$arraysize'\n";


## length + 1 in third dim
$arraysize = $#{$threedimarray[1][1]} + 1;
print "size third dim: '$arraysize'\n";
print "\n\n";


## ITERATOR

print "iterate over two dimensional array by 'foreach'\n";
foreach my $item1 (@twodimarray){
    foreach my $item2 (@{$item1}){
        print "'$item2' ";
    }
    print "\n";
}
print "\n";


print "iterate over two dimensional array by 'index'\n";
for( my $jdx=0; $jdx<1 + $#twodimarray; ++$jdx ){
    for( my $idx=0; $idx<1 + $#{$twodimarray[$jdx]}; ++$idx ){
        print "'$twodimarray[$jdx][$idx]' ";
    }
    print "\n";
}
print "\n";


## three dim


print "iterate over three dimensional array by 'foreach'\n";
foreach my $item1 (@threedimarray){
    foreach my $item2 (@{$item1}){
        foreach my $item3 (@{$item2}){
            print "'$item3' ";
        }
        print "\n";
    }
    print "---\n";
}
print "\n";


print "iterate over three dimensional array by 'index'\n";
for( my $kdx=0; $kdx < 1 + $#threedimarray; ++$kdx){
    for( my $jdx=0; $jdx < 1 + $#{$threedimarray[$kdx]}; ++$jdx){
        for( my $idx=0; $idx < 1 + $#{$threedimarray[$kdx][$jdx]}; ++$idx ){
            print "'${threedimarray[$kdx][$jdx][$idx]}' ";
        }
        print "\n";
    }
    print "---\n";
}
print "\n";

say "READY.";




