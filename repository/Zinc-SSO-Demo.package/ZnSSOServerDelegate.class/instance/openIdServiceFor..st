private
openIdServiceFor: aProviderName

	aProviderName = 'Google'
		ifTrue: [ ^ self googleOpenIDService ].
		
	aProviderName = 'Yahoo'
		ifTrue: [ ^ self yahooOpenIDService ].
		
	self error: 'Unknown OpenID Provider'