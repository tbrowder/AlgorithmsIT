#!/bin/env raku

use lib <../lib>;
use Index1Array;

my $text = "abcde";
my $p = Index1Array.new: $text;

my $q = Index1Array.new;
say "p elems ", $p.elems;
say "q elems ", $q.elems;
say "inserting a at slot 6 in q";

$q[6] = 6;

say "\$q[6] = ", $q[6];
say "q elems ", $q.elems;

say "\$p[0] ", $p[0];
say "\$p[1] ", $p[1];
say "\$p[2] ", $p[2];
say "\$p[3] ", $p[3];
say "\$p[4] ", $p[4];
say "\$p[5] ", $p[5];
say "\$p[6] ", $p[6];
say "\$p.push: 8";
$p.push: 8;
say "\$p[6] ", $p[6];

say "\$p.head ", $p.head;
say "\$p.tail ", $p.tail;
say "\$p.gist ", $p.gist;

my $r = Index1Array.new: 1, 6;
say "r start: ", $r.R-start;
say "r end: ", $r.R-end;
say "r.gist ", $r.gist;

=finish
=finish

say $p[1];
$p[1] = 'X';
say $p[1];
