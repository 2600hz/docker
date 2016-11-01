#!/usr/bin/perl -w
use strict;
my $notgood = 0;
while(<>) {
	s/\xD//g;
	if (/^not ok.*\\(.*?)$/) {
		my $test = $1;
		next if $test =~ /Incomplete/;
		$test =~ s/\\/\\\\/g;
		print "failed: $1, repeating\n"; 
		my $re = qx( docker exec -ti makebusy.kazoo ./run-test.sh \'--filter $test\' );
		if ($re =~ /\bnot ok\b/s) {
			$notgood = 1;
			print $re, "\n";
		}
	}
}

if ($notgood) {
	print "SUITE FAILED\n";
} else {
	print "SUITE OK\n";
}
