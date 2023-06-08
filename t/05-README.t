use Test;

# This the examplemused in the README

use AlgorithmsIT :ALL;
use Classes;
my $P = ArrayOneBased.new: "pattern";
my $T = ArrayOneBased.new: "some text with pattern in it (or not)";
my $pi = ArrayOneBased.new: 1, $T.length; # creates an array: [1, 2, ..., $T.length]
my @matches = KMP-Matcher $T, $P;
is @matches[0], 15;

done-testing;
