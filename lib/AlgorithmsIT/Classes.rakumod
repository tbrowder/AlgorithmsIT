unit module AlgorithmsIT::Classes;

class ArrayOneBased does Positional does Iterable is export {

has @.arr;

#| Helper attributes used to instantiate an object
has Str    $.text;
has Int    $.R-start;
has Int    $.R-end;
has List   $.list;

multi method new(Str $text?) {
    self.bless(:$text);
}

multi method new(Int $R-start, Int $R-end?) {
    my ($s, $e);
    if $R-end.defined {
        self.bless(:$R-start, :$R-end);
    }
    else {
        my $s = 1;
        my $e = $R-start;
        self.bless(:R-start($s), :R-end($e));
    }
}

multi method new(List $list) {
    self.bless(:$list);
}

submethod TWEAK {
    @!arr[0] = -1;
    if $!text.defined {
        for $!text.comb {
            @!arr.push($_)
        }
    }
    elsif $!R-start.defined and $!R-end.defined {
        die "FATAL: range end [{$!R-end}] is NOT greater than range start [{$!R-start}] " if $!R-end <= $!R-start;
        for $!R-start .. $!R-end {
            @!arr.push($_);
        }
    }
    elsif $!list.defined {
        @!arr.push($_) for $!list.values;
    }
}

method elems {
    @!arr.elems - 1;
}

method length {
    @!arr.elems - 1;
}

method AT-POS($i) {
    return-rw @!arr[$i];
}

method push($val) {
    @!arr.push: $val;
}

method head {
    @!arr[1];
}

method tail {
    @!arr.tail;
}

method gist {
    my $s = @!arr[1..*-1].join(', ');
    "[ $s ]";
}

} # end class ArrayOneBased

my constant A1B is export = ArrayOneBased;
