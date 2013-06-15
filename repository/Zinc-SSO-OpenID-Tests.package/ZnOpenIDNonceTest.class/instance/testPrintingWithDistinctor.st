tests
testPrintingWithDistinctor
	| ts nonce |

	ts := ZnOpenIDNonce decodeRFC3339Date: '2011-12-25T17:15:41Z'.	
	"ts := TimeStamp date: (Date year: 2011 month: 12 day: 25) time: (Time hour: 17 minute: 15 second: 41)."
	nonce :=  self newNonce
		timestamp: ts;
		distinctor: 'ABCD1234';
		yourself.
	self assert: '2011-12-25T17:15:41ZABCD1234' = nonce printString