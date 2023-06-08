use Test;
use Index1Array;

my $debug = 0;

my Index1Array $a;
my $text = 'some text';
my @list = <a b c>;

lives-ok {
    $a = Index1Array.new;
}, "empty input builds ok";
is $a.elems, 0;

lives-ok {
    $a = Index1Array.new: $text;
}, "text input builds ok";
is $a[1], 's';
is $a.length, $text.chars;
is $a.elems, $text.chars;

lives-ok {
    $a = Index1Array.new: 2, 5;
}, "range input builds ok";
is $a[1], 2;
is $a[4], 5;
is $a.length, 4;
is $a.elems, 4;

lives-ok {
    $a = Index1Array.new: 5;
}, "range input with end only builds ok";
is $a[1], 1;
is $a[4], 4;
is $a[5], 5;
is $a.length, 5;
is $a.elems, 5;

lives-ok {
    $a = Index1Array.new: @list;
}, "list input builds ok";
is $a[1], 'a';
is $a.length, 3;
is $a.elems, 3;

done-testing;
