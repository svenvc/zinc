rendering
renderHeaderOn: html

	html anchor
		id: 'logo' ;
		callback: [ self actionAbout ] ;
		with: 'Zn'.

	html heading
		level1 ;
		with: 'Zinc-SSO Seaside demo application'