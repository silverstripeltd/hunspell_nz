class hunspell (
	$ensure = 'present',
){

	class { 'hunspell::install': }

}
