comparing
= aOpenIDNonce
	^self timestamp = aOpenIDNonce timestamp and: [ self distinctor = aOpenIDNonce distinctor ]