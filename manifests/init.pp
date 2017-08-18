define hunspell (
	$ensure = 'present',
){

	if $hunspell::ensure != 'absent' {

		package { "hunspell":
			ensure => installed
		}

		package { "hunspell-en-us":
			ensure  => installed,
			require => Package["hunspell"],
		}

		package { "myspell-en-gb":
			ensure  => installed,
			require => Package["hunspell"],
		}

		# NZ Dictionaries
		file { "/usr/share/hunspell/":
			ensure  => directory,
			owner   => 'root',
			group   => 'root',
			mode    => '0644',
			recurse => true,
			source  => "puppet:///modules/hunspell/dictionaries/",
			require => Package["hunspell"],
		}

	}

}
