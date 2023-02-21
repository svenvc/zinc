tests
testSkipAndBack
	| stream |
	stream := ZnPositionableReadStream on: 'abcdef' readStream.
	stream skip: 2.
	self assert: stream next equals: $c.
	stream skip: 1.
	self assert: stream back equals: $d.
	self assert: stream back equals: $c.
	stream skip: -2.
	self assert: stream next equals: $a.
	stream back.
	self assert: stream upToEnd equals: 'abcdef'