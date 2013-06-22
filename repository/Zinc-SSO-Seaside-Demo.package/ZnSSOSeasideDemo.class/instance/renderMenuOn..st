rendering
renderMenuOn: html

	html anchor
		callback: [ self clearResponsePanel ] ;
		with: 'Reset'.
		
	html text: ' | '.
	
	html anchor
		callback: [ self actionAbout ] ;
		with: 'About'
	
