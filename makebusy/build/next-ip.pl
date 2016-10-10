#!/usr/bin/perl -w
use strict;
my ($ip) = @ARGV;
my ($a,$b,$c,$d) = split /\./, $ip;
printf("%d.%d.%d.%d", $a, $b, $c, ++$d);
