package DriverDeets::DB::Schema::Result::PlateSimilar;
use strict;
use warnings;
use base qw/DBIx::Class::Core/;

__PACKAGE__->table_class('DBIx::Class::ResultSource::View');

# For the time being this is necessary even for virtual views
__PACKAGE__->table('PlateSimilar');

__PACKAGE__->add_columns(qw/plate_id plate stub region/);

# do not attempt to deploy() this view
__PACKAGE__->result_source_instance->is_virtual(1);

__PACKAGE__->result_source_instance->view_definition(q[
    SELECT plate.plate_id,plate.plate,region.stub,region.region FROM plates plate
    JOIN regions region ON plate.region_id=region.region_id
    WHERE region.stub = ? AND plate.plate != ? AND ? % plate.plate LIMIT 5
]);
1;
