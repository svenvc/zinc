testing
testQueryWriting
	| fields string |
	(fields := Dictionary new)
		at: 'foo' put: '100';
		at: 'bar' put: 'a b'.
	string := String streamContents: [ :stream | ZnUtils writeQueryFields: fields on: stream ].
	self assert: (string includesSubString: 'foo=1').
	self assert: (string includesSubString: 'bar=a%20b').