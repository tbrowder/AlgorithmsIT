use Test;

use AlgorithmsIT :ALL;
use AlgorithmsIT::Classes;

my $debug = 0;

my @shifts;
my ArrayOneBased $T;
my ArrayOneBased $P;

my $pat1 = '::';
my $pat2 = ':';
my $pat3 = '-:';

my $txt1 = '23:::';
my $txt2 = 'd:efa33:23:::';
my $txt3 = 'd-:efa33:23:-::';


$T = ArrayOneBased.new: $txt1;
$P = ArrayOneBased.new: $pat1;
is KMP-Matcher($T, $P).elems, 2;

$T = ArrayOneBased.new: $txt2;
$P = ArrayOneBased.new: $pat2;
is KMP-Matcher($T, $P).elems, 5;

$T = ArrayOneBased.new: $txt3;
$P = ArrayOneBased.new: $pat3;
is KMP-Matcher($T, $P).elems, 2;

done-testing;
