tests
testPlainNext
	| stream |
	stream := ZnPositionableReadStream on: 'abc' readStream.
	self assert: stream next equals: $a.
	self deny: stream atEnd.
	self assert: stream next equals: $b.
	self assert: stream position equals: 2.
	self assert: stream next equals: $c.
	self assert: stream atEnd