tests
testReadingWithDisctinctor
	| ts nonce |
	ts := ZnOpenIDNonce decodeRFC3339Date: '2011-12-25T17:15:41Z'.
	nonce := self nonceFromString: '2011-12-25T17:15:41ZCBD123'.
	self assert: nonce timestamp = ts.
	self assert: nonce distinctor = 'CBD123'