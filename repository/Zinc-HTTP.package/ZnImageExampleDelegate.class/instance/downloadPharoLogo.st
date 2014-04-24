accessing
downloadPharoLogo
	^ ZnClient new beOneShot
		get: 'http://www.pharo-project.org/images/pharo.png';
		entity