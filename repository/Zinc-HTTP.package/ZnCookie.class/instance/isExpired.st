testing
isExpired
	^ (self expiresTimeStamp asUTC < TimeStamp current asUTC) or: [ self expires = 0 ]