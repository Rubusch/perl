#!/usr/bin/perl
use strict;
use warnings;
##
## quicksort implementations
##

sub is_greater
{
    ## is a greater than b?
    return -1 unless my $a = shift;
    return -1 unless my $b = shift;
    my $res = 0;
    $res = 1 if $a > $b;
    ## 1=yes, 0=no, -1=error
    return $res;
}


## iterative quicksort
sub qs_iterative
{
    ## params
    my $lhs = shift;
    my $rhs = shift;
    my @list = @_;
    return @_ unless $lhs < $rhs;

    ## iterative
    my @stack = ();
    push @stack, [ $lhs, $rhs ];

    while( 1 ){
        last if -1 == $#stack;
        my ($pair) = pop @stack ;
        $lhs = ${$pair}[0];
        $rhs = ${$pair}[1];

        ## init
        my $idx = $lhs+1;
        my $jdx = $rhs;
        my $pivot = $lhs;
        print "XXX lhs = '$lhs' - rhs = '$rhs; idx = '$idx'; jdx = '$jdx'; pivot = '$pivot'\n";

        my $isAscending = 1;

        while( 1 ){
            while( ( &is_greater( $list[$pivot], $list[$idx] ) == $isAscending ) && ( $idx < $rhs ) ){ ++$idx; }
            while( ( &is_greater( $list[$jdx], $list[$pivot] ) == $isAscending ) && ( $jdx > $pivot ) ){ --$jdx; }
            if( $idx >= $jdx){ last; }
            my $tmp = $list[$idx];
            $list[$idx] = $list[$jdx];
            $list[$jdx] = $tmp;
        }

        ## swap jdx (!) with pivot
        my $tmp = $list[$jdx];
        $list[$jdx] = $list[$pivot];
        $list[$pivot] = $tmp;

        ## tail recursion: push
        push @stack, [ $lhs, $pivot-1 ] unless $lhs >= $pivot-1;
        push @stack, [ $pivot+1, $rhs ] unless $pivot+1 >= $rhs;
    }
    return @list;
}


## recursive quicksort
sub qs_recursive
{
    ## params
    my $lhs = shift;
    my $rhs = shift;
    my @list = @_;
    return @_ unless $lhs < $rhs;

    ## init
    my $idx = $lhs;
    my $jdx = $rhs;
    my $pivot = $lhs;

    my $isAscending = 1;

    while( 1 ){
        while( &is_greater( $list[$pivot], $list[$idx] ) == $isAscending ){ ++$idx; }
        while( &is_greater( $list[$jdx], $list[$pivot] ) == $isAscending ){ --$jdx; }
        if( $idx >= $jdx){ last; }
        my $tmp = $list[$idx];
        $list[$idx] = $list[$jdx];
        $list[$jdx] = $tmp;
    }

    ## swap jdx (!) with pivot
    my $tmp = $list[$jdx];
    $list[$jdx] = $list[$pivot];
    $list[$pivot] = $tmp;

    ## tail recursion
    @list = &qs_recursive( $lhs, $pivot-1, @list );
    @list = &qs_recursive( $pivot+1, $rhs, @list );

    return @list;
}


## start

my @list = (5, 4, 3, 2, 1);

print "before: @list\n";
@list = &qs_iterative( 0, $#list, @list );
#@list = &qs_recursive( 0, $#list, @list );
print "after: @list\n";

print "READY.\n";
