use Test;
use Classes;

my $debug = 0;

my I1A $a;
my $text = 'some text';
my @list = <a b c>;

lives-ok {
    $a = I1A.new;
}, "empty input builds I1A ok";
is $a.elems, 0;

lives-ok {
    $a = I1A.new: $text;
}, "text input builds ok";
is $a[1], 's';
is $a.length, $text.chars;
is $a.elems, $text.chars;

lives-ok {
    $a = I1A.new: 2, 5;
}, "range input builds ok";
is $a[1], 2;
is $a[4], 5;
is $a.length, 4;
is $a.elems, 4;

lives-ok {
    $a = I1A.new: 5;
}, "range input with end only builds ok";
is $a[1], 1;
is $a[4], 4;
is $a[5], 5;
is $a.length, 5;
is $a.elems, 5;

lives-ok {
    $a = I1A.new: @list;
}, "list input builds ok";
is $a[1], 'a';
is $a.length, 3;
is $a.elems, 3;

done-testing;
