tests
testPlainExcursion
	| stream |
	stream := ZnPositionableReadStream on: 'abcdef-----------' readStream.
	self assert: (stream next: 3) equals: 'abc'.
	self assert: (stream savingPositionDo: [ stream next: 3 ]) equals: 'def'.
	self assert: (stream next: 3) equals: 'def'