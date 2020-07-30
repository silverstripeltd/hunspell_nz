class hunspell_nz (
	$ensure = 'present',
){

	package {
		'hunspell':	ensure => installed;
		'hunspell-en-us':	ensure  => installed;
	}
	if $facts['lsbdistcodename'] == 'buster' {
		package {
			'hunspell-en-gb':	ensure  => installed;
		}
	}else{
		package {
			'myspell-en-gb':	ensure  => installed;
		}
	}
	# NZ Dictionaries
	file { '/usr/share/hunspell/':
		ensure  => directory,
		owner   => 'root',
		group   => 'root',
		mode    => '0644',
		recurse => true,
		source  => 'puppet:///modules/hunspell_nz/dictionaries/',
		require => Package['hunspell'],
	}

}
