as yet unclassified
renderContentOn: html

	html heading
		level3 ;
		with: 'Microsoft user data'.
		
	userData isNil
		ifTrue: [ 
			html strong: 'No user data'.
			^ self ].

	self renderJSONDict: userData on: html.
	
	userData at: 'link' ifPresent: [ :link | self renderLink: link on: html ].
