testing
isExpired
	"Answer if I consider myself expired, based on my expiresOn variable and expirationMargin.
	Convert current date and time to UTC to prevent daylight saving issues."

	expiresOn ifNil: [ ^ true ].

	^ expiresOn <= (DateAndTime now asUTC + self expirationMargin).