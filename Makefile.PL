require 5.008;
use strict;
use warnings;


my $github    = 'https://github.com/briandfoy/';
my $main_file = 'lib/';

my %WriteMakefile = (
    'NAME'  	 	=> 'Business::ISMN',
    'VERSION_FROM' 	=> 'lib/Business/ISMN.pm', 
	'LICENSE'       => 'perl',
	'AUTHOR'        => 'brian d foy <bdfoy@cpan.org>',
	'ABSTRACT_FROM' => $main_file;	
    'PREREQ_PM'     => {
    	'List::Util'       => '0',
    	'Tie::Cycle'       => '1.21',
    	},

	'TEST_REQUIRES' => {
		'Test::More'  => '0.95',
		},

	'META_MERGE' => {
		'meta-spec' => { version => 2 },
			resources => {
				repository => {
					type => 'git',
					url  => 'https://github.com/briandfoy/business--isbn.git',
					web  => 'https://github.com/briandfoy/business--isbn',
				},
			},
		},

    clean  => { FILES => 'Business-ISMN-*' },
	);

sub arguments { \%WriteMakefile }

do_it() unless caller;
sub do_it {
	require File::Spec;
	my $MM ='ExtUtils::MakeMaker';
	my $MM_version =
		eval{ "$MM " . $WriteMakefile{'CONFIGURE_REQUIRES'}{'ExtUtils::MakeMaker'} }
			//
		"$MM 6.64";
	eval "use $MM_version" || die "Could not load $MM_version: $@";
	eval "use Test::Manifest 1.21" 
		if -e File::Spec->catfile( qw(t test_manifest) );
	WriteMakefile( %WriteMakefile );
	}


no warnings;
__PACKAGE__;
