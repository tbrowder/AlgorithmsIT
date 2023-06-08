Functions from *Introduction to Algorithms, Third Edition*
==========================================================

The functions below have been translated from the *psuedo code* in the book into *Raku*. To ease the translation, Raku classes were created to mimic contructs in the pseudo code as much as possible.

Raku classes
------------

### **Index1Array**

The main feature of this class is that its first slot is at index 1 as opposed to 0 in Raku arrays. Only necessary features of a normal array have been added, so its feature list is not exhaustive. However, users are encouraged to ask for additional features or submit a PR for such.

The class enables the following ways to instantiate an array:

#### An empty but extendible array

    my $a = Index1Array.new;

#### From a text string

    my $a = Index1Array.new: "abbxide x";

#### As an array filled with a number sequence M..N

Specifying beginning and end:

    my $a = Index1Array.new: 2, 6;

Specifying end only (beginning is 1 by default):

    my $a = Index1Array.new: 5;

#### From a list

    my $a = Index1Array.new: @list;

Raku functions (subroutines)
----------------------------

### **KMP-Matcher** (Ref. 1, p. 1005)

### **Compute-Prefix-Function** (Ref. 1, p. 1006)

