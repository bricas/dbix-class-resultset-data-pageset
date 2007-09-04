package DBIx::Class::ResultSet::Data::Pageset;

use strict;
use warnings;

use base qw( DBIx::Class::ResultSet );

use Data::Pageset ();

our $VERSION = '0.02';

=head1 NAME

DBIx::Class::ResultSet::Data::Pageset - Get a Data::Pageset pager from a resultset

=head1 SYNOPSIS

    my $rs = $schema->resultset('Foo')->search( { }, { pages_per_set => 5 } );
    my $pager = $rs->pageset;

=head1 DESCRIPTION

This is a simple way to allow you to get a L<Data::Pageset> object for paging
rather than the standard L<Data::Page> object.

=head1 METHODS

=head2 pageset( )

Returns a L<Data::Pageset> object for paging. This will grab the C<pages_per_set>
option from the resultset attributes or use C<10> as the default.

=cut

sub pageset {
    my( $self ) = @_;
    my $pager = $self->pager;
    my $attrs = $self->{attrs};

    return Data::Pageset->new( {
        ( map { $_ => $pager->$_ } qw(
            entries_per_page
            total_entries
            current_page
        ), ),
        pages_per_set => $attrs->{ pages_per_set } || 10,
    } );
}

=head1 COPYRIGHT AND LICENSE

Copyright 2007 by Brian Cassidy

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself. 

=head1 SEE ALSO

=over 4 

=item * L<DBIx::Class>

=back

=cut

1;
