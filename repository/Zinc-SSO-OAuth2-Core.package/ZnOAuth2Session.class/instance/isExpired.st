testing
isExpired
	"Answer if I consider myself expired, based on my expiresOn variable and expirationMargin."
	expiresOn ifNil: [ ^ true ].
	^ expiresOn <= (DateAndTime now + self expirationMargin).