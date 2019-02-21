#!/usr/bin/env perl

use autodie;
use strict;
use utf8;
use warnings;

our $VERSION = 0.01;

use Carp qw( croak );
use Cpanel::JSON::XS qw( decode_json );
use Cwd qw( abs_path );
use File::Basename qw( dirname );
use File::Slurper qw( read_binary write_binary );
use File::Spec;
use Math::Int128 qw( uint128 );
use MaxMind::DB::Writer::Serializer;
use MaxMind::DB::Writer::Tree;
use MaxMind::DB::Writer::Util qw( key_for_data );
use Net::Works::Network;

my @databases = ( 'Benchmark', 'Geolix' );

my $dir_script = File::Spec->rel2abs( dirname(__FILE__) );
my $dir_data   = File::Spec->catfile( $dir_script, '../data/mmdb2' );
my $dir_output = File::Spec->catfile( $dir_script, '../priv/mmdb2' );

sub main {
    for my $database (@databases) {
        _write_mmdb2($database);
    }

    return;
}

sub _write_mmdb2 {
    my $name   = shift;
    my $writer = MaxMind::DB::Writer::Tree->new(
        ip_version            => 6,
        record_size           => 24,
        alias_ipv6_to_ipv4    => 1,
        languages             => ['en'],
        database_type         => $name,
        description           => { en => $name . ' Test Database' },
        map_key_type_callback => sub {
            my $key = shift;

            return
                  $key eq 'array' ? ['array', 'uint32']
                : $key eq 'double' ? 'double'
                : $key eq 'float' ? 'float'
                : $key eq 'map' ? 'map'
                : 'utf8_string';
        },
    );

    my $nodes =
      decode_json(
        read_binary( File::Spec->catfile( $dir_data, "$name.json" ) ) );

    foreach my $node ( @{$nodes} ) {
        foreach my $network ( keys %{$node} ) {
            if (exists $node->{$network}{'extrapolate_binary'}) {
                $node->{$network}{'extrapolate_binary'} = 'x' x $node->{$network}{'extrapolate_binary'};
            }

            $writer->insert_network(
                Net::Works::Network->new_from_string( string => $network ),
                $node->{$network} );
        }
    }

    open my $output_fh, '>', File::Spec->catfile( $dir_output, "$name.mmdb" );
    $writer->write_tree($output_fh);
    close $output_fh;

    return;
}

main();
