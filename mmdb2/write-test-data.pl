#!/usr/bin/env perl

use autodie;
use strict;
use warnings;

our $VERSION = 0.01;

use MaxMind::DB::Writer::Tree;
use Net::Works::Network;

my $tree = MaxMind::DB::Writer::Tree->new(
    ip_version            => 6,
    record_size           => 24,
    alias_ipv6_to_ipv4    => 1,
    database_type         => 'Geolix-Test',
    languages             => ['en'],
    description           => { en => 'Geolix Test Database' },
    map_key_type_callback => sub { 'utf8_string' },
);

my $network = Net::Works::Network->new_from_string( string => '1.1.1.1/32' );

$tree->insert_network( $network, { type => 'test' } );

open my $fh, '>', './Geolix.mmdb';
$tree->write_tree($fh);
close $fh;
