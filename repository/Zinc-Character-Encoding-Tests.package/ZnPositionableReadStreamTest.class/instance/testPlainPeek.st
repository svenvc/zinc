tests
testPlainPeek
	| stream |
	stream := ZnPositionableReadStream on: 'abc' readStream.
	self assert: stream next equals: $a.
	self assert: stream peek equals: $b.
	self assert: stream next equals: $b.
	self assert: stream position equals: 2.
	self assert: stream peek equals: $c.
	self assert: stream next equals: $c.
	self assert: stream atEnd