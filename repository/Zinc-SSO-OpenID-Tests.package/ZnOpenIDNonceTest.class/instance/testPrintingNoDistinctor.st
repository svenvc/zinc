tests
testPrintingNoDistinctor
	| ts nonce |

	ts := ZnOpenIDNonce decodeRFC3339Date: '2010-11-30T13:42:59Z'.
	" ts := TimeStamp date: (Date year: 2010 month: 11 day: 30) time: (Time hour: 13 minute: 42 second: 59). "
	nonce :=  self newNonce
		timestamp: ts;
		yourself.
	self assert: '2010-11-30T13:42:59Z' = nonce asString