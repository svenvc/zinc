rendering
renderContentOn: html

	html heading
		level3 ;
		with: 'Google user data'.
		
	userData isNil
		ifTrue: [ 
			html strong: 'No user data'.
			^ self ].

	self renderJSONDict: userData on: html.

	userData at: 'link' ifPresent: [ :link | self renderLink: link on: html ].
	userData at: 'picture' ifPresent: [ :link | self renderImage: (link, '?sz=200') on: html ]