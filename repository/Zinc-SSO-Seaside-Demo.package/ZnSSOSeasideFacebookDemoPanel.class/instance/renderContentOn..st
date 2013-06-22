rendering
renderContentOn: html

	html heading
		level3 ;
		with: 'Facebook user data'.
		
	userData isNil
		ifTrue: [ 
			html strong: 'No user data'.
			^ self ].

	self renderJSONDict: userData on: html.
	
	userData at: 'link' ifPresent: [ :link | self renderLink: link on: html ].
	userData at: 'username' ifPresent: [ :name |
		self renderImage: ('http://graph.facebook.com/', name, '/picture?type=large') on: html ]