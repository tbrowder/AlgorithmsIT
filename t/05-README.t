use Test;

# This is the example used in the README

use AlgorithmsIT :ALL;
use AlgorithmsIT::Classes;
my $P = ArrayOneBased.new: "abab";        # the pattern to be sought
my $T = ArrayOneBased.new: "abababcabab"; # some text with the pattern in it (or not)";
my $pi = ArrayOneBased.new: $T.length;    # creates array: [1, 2, ..., $T.length]
my @matches = KMP-Matcher $T, $P;
is @matches.elems, 3;
is @matches[0], 0;
is @matches[1], 2;
is @matches[2], 7;

done-testing;
