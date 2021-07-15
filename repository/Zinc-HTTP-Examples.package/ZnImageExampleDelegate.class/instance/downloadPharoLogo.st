accessing
downloadPharoLogo
	^ ZnClient new beOneShot
		get: 'http://pharo.org/web/files/pharo.png';
		entity