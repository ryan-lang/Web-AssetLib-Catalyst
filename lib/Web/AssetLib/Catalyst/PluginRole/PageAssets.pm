package Web::AssetLib::Catalyst::PluginRole::PageAssets;

use Method::Signatures;
use Moose::Role;
use Web::AssetLib::Bundle;

has 'page_assets' => (
    is      => 'rw',
    isa     => 'ArrayRef',
    traits  => [qw/Array/],
    handles => { add_assets => 'push' },
    default => sub { [] }
);

method compile_page_assets (...) {
    my $bundle = Web::AssetLib::Bundle->new();

    $self->log->dump( 'assets requested for page: ',
        $self->page_assets, 'trace' );

    foreach ( @{ $self->page_assets } ) {
        next unless $_;
        $bundle->addAsset($_);
    }

    $self->stash( page_assets => $bundle );
}

no Moose::Role;

=head1 COPYRIGHT & LICENSE

Copyright 2012 "Ryan Lang", All Rights Reserved.

=cut

1;
