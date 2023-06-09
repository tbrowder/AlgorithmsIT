unit module AlgorithmsIT;

use Classes;


#| Two functions from Chapter 32 of 'Introduction to Algorithms',
#| Third Edition, String Matching, pages 1005-1006.
#|
#| KMP-Matcher(T, P)
#|
#| The routines are exported by their page number in the Third Edition.

=begin code
 1  n = T.length
 2  m = P.length
 3  pi = Compute-Prefix-Function(P)
 4  q = 0                                            // number of characters matched
 5  for i = 1 to n                                   // scan the text from left to right
 6      while q > 0 and P[q + 1] not equal T[i]
 7          q = pi[q]                                // next character does not match
 8      if P[q + 1] == T[i]
 9          q = q + 1                                // next character matches
10      if q == m                                    // is all of P matched?
11          print "Pattern occurs with shift" i - m
12          q = pi[q]                                // look for the next match
=end code
sub KMP-Matcher(ArrayOneBased $T, ArrayOneBased $P, :$debug  --> List) is export(:p1005) {
    my $n = $T.length; #= length of text
    my $m = $P.length; #= length of patttern

    my @shifts;

    my ArrayOneBased $pi = Compute-Prefix-Function($P);
    my Int $q = 0;                                       # number of characters matched
    for 1..$n -> $i {                                    # scan the text from left to right
        while $q > 0 and $P[$q + 1] ne $T[$i] {
            $q = $pi[$q];                                # next character does not match
        }
        if $P[$q + 1] eq $T[$i] {
            $q = $q + 1;                                 # next character matches
        }
        if $q == $m {                                    # is all of P matched?
            my $shift = $i - $m;                         # i - m
            @shifts.push: $shift;
            note "Pattern occurs with shift $shift" if $debug;    # i - m;
            $q = $pi[$q];                                # look for the next match
        }
    }
    @shifts
}

#| Compute-Prefix-Function(P)
=begin code
 1  m = P.length
 2  let pi[1..m] be a new array
 3  pi[1] = 0
 4  k = 0
 5  for q = 2 to m
 6      while k > 0 and P[k + 1] not equal P[q]
 7          k = pi[k]
 8      if P[k + 1] == P[q]
 9          k = k + 1
10      pi[q] = k
11  return pi
=end code
sub Compute-Prefix-Function(ArrayOneBased $P --> ArrayOneBased) is export(:p1006) {

    my $m = $P.length;
    my $pi = ArrayOneBased.new: 1, $m;          # let pi[1..m] be a new array
    $pi[1] = 0;
    my $k  = 0;
    for 2..$m -> $q {                           # for q = 2 to m
        while $k > 0 and $P[$k + 1] ne $P[$q] { #     while k > 0 and P[k + 1] not equal P[q]
            $k = $pi[$k];                       #         k = pi[k]
        }
        if $P[$k + 1] eq $P[$q] {               #     if P[k + 1] == P[q]
            $k = $k + 1;                        #         k = k + 1
        }
        $pi[$q] = $k;                           #     pi[q] = k
    }
    $pi                                         # return pi
}
