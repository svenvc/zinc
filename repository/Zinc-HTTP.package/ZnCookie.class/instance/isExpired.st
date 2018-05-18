testing
isExpired
	| expirationTimeStamp |
	(self hasAttribute: 'expire') ifFalse: [ ^ false ].
	[ expirationTimeStamp := self expiresTimeStamp ] on: Error do: [ ^ false ].
	"note that max-age (#maxage) is not used"
	^ expirationTimeStamp asUTC < DateAndTime now asUTC