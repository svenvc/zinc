tests
testOrderingSingleDistinctor
	| ts nonce1 nonce2 |

	ts := DateAndTime now.
	nonce1 := self newNonce
		timestamp: ts;
		yourself.
	nonce2 := self newNonce
		timestamp: ts;
		distinctor: '1';
		yourself.
	self assert: nonce1 < nonce2