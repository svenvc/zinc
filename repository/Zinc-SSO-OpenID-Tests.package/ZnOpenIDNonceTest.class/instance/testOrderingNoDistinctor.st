tests
testOrderingNoDistinctor
	| ts nonce1 nonce2 nonce3 |

	ts := DateAndTime now.
	nonce1 := self newNonce
		timestamp: ts;
		yourself.
	nonce2 := self newNonce
		timestamp: ts;
		yourself.
	nonce3 := self newNonce
		timestamp: ts + 1 days;
		yourself.
	self assert: nonce1 = nonce2.
	self assert: nonce1 < nonce3.
	self assert: nonce3 > nonce1