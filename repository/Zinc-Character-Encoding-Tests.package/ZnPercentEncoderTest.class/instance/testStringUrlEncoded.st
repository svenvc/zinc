tests
testStringUrlEncoded
	self assert: ('foo bar' urlEncoded) equals: 'foo%20bar'