package Catalyst::Plugin::DBIC::TemplateMaker;

use strict;
use warnings;
use NEXT;

our $VERSION = '0.01';

sub get_display_template {
    my ($c, $resultset, $ttaccessor) = @_;
    my @ttcols = map {"[% $ttaccessor.$_ %]&lt;br /&gt;<br />"} $resultset->columns;
    return join "\n", @ttcols;
}

sub setup {
    my $c = shift;
    $c->NEXT::setup(@_);
}

1;
__END__

=head1 NAME

Catalyst::Plugin::DBIC::TemplateMaker - Catalyst Plugin for
Auto-generating simple Template Toolkit templates

=head1 SYNOPSIS

  # include it in plugin list
  use Catalyst qw/DBIC::TemplateMaker/;
  # then get Catalyst to spit out a template
  $c->response->body($c->get_display_template($resultset, 'tt_accessor_name'));

=head1 DESCRIPTION

Sometimes all you want is a set of hand made templates to display
stuff from a database.  All this plugin does is provide you with a
method to create an extremely simple and featureless template which
you can then copy and paste from the browser into your text editor and
edit into a real template.  It is intended as a development aid only
and use of the plugin should be removed on deployment.

It does virtually nothing, apart from saving you some typing.  You
must resolve any related columns to a properly stringified name for
example.

=head1 CONFIGURATION

None required or available.

=head1 SEE ALSO

L<Catalyst> L<Template> L<DBIx::Class>

=head1 AUTHOR

Kieren Diment, E<lt>kd@totaldatasolution.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2006 by Kieren Diment

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.6 or,
at your option, any later version of Perl 5 you may have available.

=cut
