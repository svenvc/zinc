accessing
numbersForPost
	(self request hasEntity and: [ self request entity contentType = ZnMimeType textPlain])
		ifNotNil: [ :numbers | 
			^ (self request entity contents findTokens: { Character space. Character tab. Character cr. Character lf. $, }) collect: [ :each | 
				[ each asNumber ] on: Error do: [ 0 ] ] ].
	^ #()