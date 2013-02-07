rendering
renderContentOn: html

	self renderHeaderOn: html.
	
	html div
		style: 'clear: both; ' ;
		with: [
			self responsePanel notNil
				ifTrue: [
					html render: self responsePanel.
					html horizontalRule ]
				ifFalse: [
					self renderSignInOptionsOn: html ].
			self renderMenuOn: html ]