initialize-release
setUp

	| begin secondsSinceEpoch |
	
	begin := DateAndTime year: 1970 day: 1 hour: 0 minute: 0 second: 0 offset: Duration zero. 
	secondsSinceEpoch := (DateAndTime now asUTC - begin) asSeconds.
	
	self version: '1.0'.
	self signatureMethod: 'HMAC-SHA1'.
	self timestamp: secondsSinceEpoch asString.
	self nonce: UUID new asString