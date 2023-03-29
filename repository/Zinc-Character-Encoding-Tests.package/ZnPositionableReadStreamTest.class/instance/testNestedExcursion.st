tests
testNestedExcursion
	| stream |
	stream := ZnPositionableReadStream on: 'abcdef---XYZ!1--------' readStream.
	self assert: (stream next: 3) equals: 'abc'.
	stream savingPositionDo: [
		self assert: (stream next: 3) equals: 'def'.
		stream savingPositionDo: [
			stream upTo: $!.
			self assert: (stream peekFor: $1) ].
		stream skip: 3.
		self assert: (stream next: 3) equals: 'XYZ' ].
	self assert: (stream next: 3) equals: 'def'