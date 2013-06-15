tests
testHash
	| ts nonce1 nonce2 nonce3 nonce4 |

	ts := DateAndTime now.
	nonce1 := self newNonce
		timestamp: ts;
		distinctor: 'ABCD123' yourself.
	nonce2 := self newNonce
		timestamp: ts;
		distinctor: 'ABCD123' yourself.
	nonce3 := self newNonce
		timestamp: ts + 1 days;
		distinctor: 'ABCD124' yourself.
	nonce4 := self newNonce
		timestamp: ts + 1 days;
		yourself.
	self assert: nonce1 hash = nonce2 hash.
	self deny: nonce1 hash = nonce3 hash.
	self deny: nonce1 hash = nonce4 hash.
	self deny: nonce3 hash = nonce4 hash