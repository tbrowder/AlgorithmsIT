Functions from *Introduction to Algorithms, Third Edition*
==========================================================

The following functions have been translated from the *psuedo code* in the book into *Raku*. To ease the translation, Raku classes were created to mimic contructs in the pseudo code as much as possible. Current classes include:

  * **Index1Array**

    The main feature of this class is that its first slot is at index 1 as opposed to 0 in Raku arrays. Only necessary features of a normal array have been added, so its feature list is not exhaustive. However, users are encouraged to ask for additional features or submit a PR for such.

    The class enables the following ways to instantiate an array:

      * An empty but extendible array

        my $a = Index1Array.new;

      * From a text string

        my $a = Index1Array.new: "abbxide x";

      * As an array filled with a number sequence M..N

        my $a = Index1Array.new: 1, 6;

      * From a list As an array filled with a number sequence M..N

        my $a = Index1Array.new: @list;

