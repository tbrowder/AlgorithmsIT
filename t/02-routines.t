use Test;
use AlgorithmsIT :ALL;
use Index1Array;

my $debug = 0;

my @shifts;
my $text;
my Index1Array $T;
my Index1Array $P;
my Index1Array $pi;
my $pattern = 'ababbabbabbababbabb'; # from p. 1011

lives-ok {
    $P = Index1Array.new: $pattern;
}, "pattern array builds ok";

lives-ok {
    $pi = Compute-Prefix-Function $P;
}, "pattern computes ok";

$text = 'ababbabbabbababbabb';
      # 'ababbabbabbababbabb'; # shift 0
lives-ok {
    $T .= new: $text;
}, "text array builds ok";

lives-ok {
  @shifts = KMP-Matcher $T, $P;
}, "text matches ok";
is @shifts.head, 0, "match at shift 0 (beginning of text)";;

$text = 'xababbabbabbababbabb';
      #  'ababbabbabbababbabb'; # shift 1
$T .= new: $text;
@shifts = KMP-Matcher $T, $P;
is @shifts.head, 1, "match at shift 1";

$text = 'xxababbabbabbababbabb';
      #   'ababbabbabbababbabb'; # shift 2
$T .= new: $text;
@shifts = KMP-Matcher $T, $P;
is @shifts.head, 2, "match at shift 2";

$text = 'babbabbabbababbabb';
      # 'ababbabbabbababbabb'; # no match - pattern too long
$T .= new: $text;
@shifts = KMP-Matcher $T, $P;
is @shifts.elems, 0, "no match, shifts list is empty (pattern longer than text)";

# some dup tests
$pattern = "bab";
$text = "ababedbab"; # expect shifts at: 1, 6
$P .= new: $pattern;
$T .= new: $text;
@shifts = KMP-Matcher $T, $P;
is @shifts.head, 1, "new pattern 'bab', first shift";;
is @shifts.tail, 6, "new pattern 'bab', second shift";;

$pattern = "abab";
$text = "abababab"; # expect shifts at: 0, 4
$P .= new: $pattern;
$T .= new: $text;
@shifts = KMP-Matcher $T, $P;
my $s = 0;
is @shifts.elems, 2, "correct number of shifts";
is @shifts[0], 0, "new pattern 'abab', shift {++$s}";
is @shifts[1], 4, "new pattern 'abab', shift {++$s}";

$pattern = "ab ab";
$text = "ab abab ab"; # expect shifts at: 0, 5
$P .= new: $pattern;
$T .= new: $text;
@shifts = KMP-Matcher $T, $P;
$s = 0;
is @shifts.elems, 2, "correct number of shifts";
is @shifts[0], 0, "new pattern 'ab ab', shift {++$s}";
is @shifts[1], 5, "new pattern 'ab ab', shift {++$s}";

# example from the README
$P .= new: "pattern";
$T .= new: "some text with pattern in it (or not)";
my @matches = KMP-Matcher $T, $P;
say @matches.gist if $debug; # OUTPUT: «[15]␤» # 15 shifts from the first character
is @matches[0], 15, "from README example, expected a shift of 15";

done-testing;
