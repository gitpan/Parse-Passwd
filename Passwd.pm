package Parse::Passwd;

use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

require Exporter;

@ISA = qw(Exporter AutoLoader);
# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT = qw(
	
);
$VERSION = '1.4';


# Preloaded methods go here.
my @field = 
  qw(username password uid gid gcos_field fullname home_dir login_shell);

sub fields {
  
  @field;

}

sub file {

  shift;
  my $file = shift || '/etc/passwd';

  open E, $file or die "Error opening $file: $!";

  my @user;


  while (<E>) {
    my %user;

    @user{@field} = split ':' ;
    chomp $user{home_dir}  ;
    push @user, \%user;
  }

  \@user

}
# Autoload methods go after =cut, and are processed by the autosplit program.

1;
__END__
# Below is the stub of documentation for your module. You better edit it!

=head1 NAME

Parse::Passwd - parse Unix passwd files

=head1 SYNOPSIS

  use Parse::Passwd;

  ## example 1
  print join ',', Parse::Passwd->fields;

  ## example 2
  my $p = Parse::Passwd->file;

  open P, ">passwd.jdb" or die $!;

  for (@$p) {
    print join ' -- ', @{$_}{Parse::Passwd->fields} ;
    print "\n";
  }


  ## example 3
  my $p = Parse::Passwd->file;
  use Data::Dumper; print Dumper($p);

  # OUTPUT

  $VAR1 = [
          {
            'login_shell' => undef,
            'uid' => '0',
            'fullname' => '/',
            'gid' => '0',
            'home_dir' => '/sbin/sh',
            'username,' => 'root',
            'password,' => 'x',
            'gcos_field' => 'Super-User'
          },
          {
            'login_shell' => undef,
            'uid' => 2026,
            'fullname' => '/export/home/collinss',
            'gid' => 141,
            'home_dir' => '/usr/bin/bash ',
            'username,' => 'collinss',
            'password,' => 'x',
            'gcos_field' => 'Sam Collins - Standard User'
          },
          {
            'login_shell' => undef,
            'uid' => 2027,
            'fullname' => '/export/home/wintili',
            'gid' => 141,
            'home_dir' => '/usr/bin/bash ',
            'username,' => 'wintili',
            'password,' => 'x',
            'gcos_field' => 'Will Intel - Basic user'
          },
     ];

=head1 DESCRIPTION

This is a lightweight alternative to Unix::PasswdFile. 

=head1 METHODS

=head2 ->file ( [ $file ] )

The class method file optionally takes one file argument to change the
location of the C<passwd> file. It returns a *reference* to an array of
hash references.

=head2 ->fields

Returns an array giving the field names of a passwd file in order.

=head1 AUTHOR

T. M. Brannon, <tbone@cpan.org>

=head1 SEE ALSO

Unix::PasswdFile.

=cut
