use lib '/export/home/brannont/jdb/Parse/Passwd/blib/lib';

use strict;
use Data::Dumper;
use Parse::Passwd;

sub jdb_header {
  my @column_name = @_;

  qq(#h @column_name);
}

my $p = Parse::Passwd->file;

#die Dumper($p);

my $element_sep = (chr hex '20') x 2;
my $record_sep = "\n";

print jdb_header(Parse::Passwd->fields);
print $record_sep;

for (@$p) {
  print join $element_sep, @{$_}{Parse::Passwd->fields} ;
  print $record_sep;
}



