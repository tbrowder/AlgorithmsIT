[![Actions Status](https://github.com/tbrowder/AlgorithmsIT/actions/workflows/linux.yml/badge.svg)](https://github.com/tbrowder/AlgorithmsIT/actions) [![Actions Status](https://github.com/tbrowder/AlgorithmsIT/actions/workflows/macos.yml/badge.svg)](https://github.com/tbrowder/AlgorithmsIT/actions) [![Actions Status](https://github.com/tbrowder/AlgorithmsIT/actions/workflows/windows.yml/badge.svg)](https://github.com/tbrowder/AlgorithmsIT/actions)

NAME
====

**AlgorithmsIT** - Provides some functions from *Introduction to Algorithms*, Third Edition

SYNOPSIS
========

```raku
use AlgorithmsIT :ALL;
use Classes;
my $P = ArrayOneBased.new: "abab";        # the pattern to be sought
my $T = ArrayOneBased.new: "abababcabab"; # text with or without the pattern;
my @matches = KMP-Matcher $T, $P;         # find any matches
say @matches.gist; 
# OUTPUT: «[0, 2, 7]␤» 
#   0, 2, and 7 are shifts from the input's # first character to the match 
#   positions.  The @matches array would be empty if no match were found.
```

Note the previous version had an error in its implementation so it could not handle overlapping pattern matches. This version works as its authors intended it to, thanks to Professor Cormen's reply to my erroneous bug report.

DESCRIPTION
===========

**AlgorithmsIT** is a collection of a small subset of functions in Reference 1.

See more details at [FUNCTIONS](./FUNCTIONS.md)

Credits
=======

Thanks to my Raku friend, '@tonyo' (on IRC #raku), for his help with the **ArrayOneBased** class. See his many Raku contributions at `https://github.com/tony-o/`.

References
==========

1. Thomas H. Cormen, et alii, *Introduction to Algorithms*, Third Edition, February 2009.

AUTHOR
======

Tom Browder <tbrowder@acm.org>

COPYRIGHT AND LICENSE
=====================

© 2023 Tom Browder

This library is free software; you may redistribute it or modify it under the Artistic License 2.0.

