use inc::Module::Install 0.67;

name 'DBIx-Class-ResultSet-Data-Pageset';
all_from 'lib/DBIx/Class/ResultSet/Data/Pageset.pm';

requires 'Data::Pageset' => '1.02';
requires 'DBIx::Class';

requires 'Test::More';

auto_install;
WriteAll;
