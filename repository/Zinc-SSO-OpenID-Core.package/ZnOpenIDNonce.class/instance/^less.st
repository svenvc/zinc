comparing
< aOpenIDNonce
	self timestamp < aOpenIDNonce timestamp
		ifTrue: [ ^ true ].
	self timestamp > aOpenIDNonce timestamp
		ifTrue: [ ^ false ].
	self distinctor = aOpenIDNonce distinctor
		ifTrue: [ ^ false ].
	self distinctor ifNil: [ ^ true ].
	aOpenIDNonce timestamp ifNil: [ ^ false ].
	^ self distinctor < aOpenIDNonce distinctor