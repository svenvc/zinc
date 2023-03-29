tests
testUsage
	| key value |
	key := 'key-' , 100 atRandom asString.
	value := 'value-' , 100 atRandom asString.

	self assert: client contents isEmpty.
	self should: [ client at: key ] raise: KeyNotFound.

	client at: key put: value.
	self assert: (client at: key) equals: value.

	client removeKey: key.
	self should: [ client at: key ] raise: KeyNotFound