use Test;
use AlgorithmsIT :ALL;
use Index1Array;

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
is @shifts.head, 1;
is @shifts.tail, 6;

$P .= new: $text;

done-testing;
