use Test;
use AlgorithmsIT :ALL;

my $pattern = "ababbabbabbababbabb"; # from p. 1011
my @text = <
    ababbabbabbababbabb
    xababbabbabbababbabb
    xxababbabbabbababbabb
    xxxababbabbabbababbabb
    babbabbabbababbabb
>;

my @P = $pattern.comb;
@P.unshift: -1;
my @results;
my @T;

lives-ok {
    @results = Compute-Prefix-Function @P;
}
is @P[0], -1, "\@P[0] slot should be -1";

for @text -> $text {
    @T = $text.comb;
    lives-ok {
        my @results = KMP-Matcher @T, @P;
    }
}  
is @T[0], -1, "\@T[0] slot should be -1";

done-testing;
