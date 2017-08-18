class hunspell (
	$ensure = 'present',
){

	package {
		"hunspell":	ensure => installed;
		"hunspell-en-us":	ensure  => installed;
		"myspell-en-gb":	ensure  => installed;
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
