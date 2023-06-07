unit class Index1Array does Positional does Iterable;

has @.arr;
has Str    $.text;
has Int    $.R-start;
has Int    $.R-end;

multi method new(Str $text?) {
    self.bless(:$text);
}

multi method new(Int $R-start, Int $R-end) {
    self.bless(:$R-start, :$R-end);
}

submethod TWEAK {
    @!arr[0] = -1;
    if $!text.defined {
        for $!text.comb {
            @!arr.push($_)
        }
    }
    elsif $!R-start.defined and $!R-end.defined {
        die "FATAL: range end is NOT greater than range end []" if $!R-end <= $!R-start;
        for $!R-start .. $!R-end {
            @!arr[$_] = $_;
        }
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
