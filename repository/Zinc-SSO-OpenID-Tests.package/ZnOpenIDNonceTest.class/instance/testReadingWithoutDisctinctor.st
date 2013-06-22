tests
testReadingWithoutDisctinctor
	| ts nonce |
	ts := ZnOpenIDNonce decodeRFC3339Date: '2011-12-25T17:15:41Z'.
	nonce := self nonceFromString: '2011-12-25T17:15:41Z'.
	self assert: nonce timestamp = ts