tests
testUTF8
	| data stream |
	data := 'Les élèves Françaises ont 100 €'.
	stream := ZnPositionableReadStream on: (ZnCharacterReadStream on: data utf8Encoded readStream).
	self assert: (stream next: 3) equals: 'Les'.
	stream skip: 1.
	stream savingPositionDo: [
		self assert: (stream next: 6) equals: 'élèves'.
		self assert: stream next equals: Character space ].
	self assert: (stream next: 6) equals: 'élèves'.
	self assert: (stream peekFor: Character space).
	2 timesRepeat: [ stream upTo: Character space ].
	self assert: (stream upTo: $€) trimBoth asNumber equals: 100.
	self assert: stream atEnd