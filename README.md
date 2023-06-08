[![Actions Status](https://github.com/tbrowder/AlgorithmsIT/actions/workflows/linux.yml/badge.svg)](https://github.com/tbrowder/AlgorithmsIT/actions) [![Actions Status](https://github.com/tbrowder/AlgorithmsIT/actions/workflows/macos.yml/badge.svg)](https://github.com/tbrowder/AlgorithmsIT/actions) [![Actions Status](https://github.com/tbrowder/AlgorithmsIT/actions/workflows/windows.yml/badge.svg)](https://github.com/tbrowder/AlgorithmsIT/actions)

NAME
====

**AlgorithmsIT** - Provides some functions from 'Introduction to Algorithms', Third Edition

SYNOPSIS
========

```raku
use AlgorithmsIT;
my $P = Index1Array.new: "pattern";
my $T = Index1Array.new: "some text with pattern in it (or not);
my $pi = Index1Array.new: 1, $T.length;
my @matches = KMP-Matcher $T, $P;
say @matches.gist; # OUTPUT: «[15]␤» # 15 shifts from the first character
                   # The @matches array would be empty if no match was found
```

DESCRIPTION
===========

**AlgorithmsIT** is a collection of functions in Reference 1.

Credits
=======

To my Raku friend, '@tonyo' for his help with the **Index1Array** class.

References
==========

#### 1. Thomas H. Cormen, et alii, *Introduction to Algorithms*, Third Edition, February 2009.

AUTHOR
======

Tom Browder <tbrowder@acm.org>

COPYRIGHT AND LICENSE
=====================

© 2023 Tom Browder

This library is free software; you may redistribute it or modify it under the Artistic License 2.0.

