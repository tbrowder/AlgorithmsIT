Functions from *Introduction to Algorithms, Third Edition*
==========================================================

The functions below have been translated from the *psuedo code* in the book into *Raku*. To ease the translation, Raku classes were created to mimic contructs in the pseudo code as much as possible.

Raku classes
------------

### **ArrayOneBased**

(Note the class has a short name for convenience: `A1B`.)

The main feature of this class is that its first slot is at index 1 as opposed to 0 in Raku arrays. Only necessary features of a normal array have been added, so its feature list is not exhaustive. However, users are encouraged to ask for additional features or submit a PR for such.

The class provides the following ways to instantiate an array:

#### An empty but extendible array

    my $a = ArrayOneBased.new;

#### From a text string

    my $a = ArrayOneBased.new: "abbxide x";

#### As an array filled with a number sequence M..N

Specifying beginning and end:

    my $a = ArrayOneBased.new: 2, 6;

Specifying end only (beginning is 1 by default):

    my $a = ArrayOneBased.new: 5;

#### From a list

    my $a = ArrayOneBased.new: @list;

Raku functions (subroutines)
----------------------------

The following two functions are used to employ the *Knuth-Morris-Pratt* (KMP) algorithms for pattern matching. See examples of their use in the test routines.

The functions will find all non-overlapping matches of a specified pattern in an input text string. (It should be very useful in DNA analysis.) Following is an example of a pattern and its matches. The results of a KMP pattern match is a list of the "shifts" for each match. A shift is a number representing the number of characters after the first character of the input string. No shifts will be reported for a situation with no matches. Of course an attempted match of an input string with a longer pattern will result in no match.

A pattern: "AACT". A DNA string: "AAACTTTAACTAA" (13 chars).

The matches:

        AAACTTTAACTAA  # 13 characters in this string
         AACT  AACT    # two matches: the 1st at shift of 1, the 2nd is at a shift of 7

### **KMP-Matcher** (Ref. 1, p. 1005)

Following is the pseudo code from Ref. 1:

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

Line 12 is in error and should read: `q = 0` (a bug report has been filed with the publisher).

The Raku signature:

    KMP-Matcher(ArrayOneBased $T, ArrayOneBased $P --> List)
    {...}

### **Compute-Prefix-Function** (Ref. 1, p. 1006)

Following is the pseudo code from Ref. 1:

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

The Raku signature:

    Compute-Prefix-Function(ArrayOneBased $P --> ArrayOneBased)
    {...}

