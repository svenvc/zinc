tests
testPositionErrors
	| data stream |
	data := ByteArray new: 1000 streamContents: [ :out |
		100 timesRepeat: [ out nextPutAll: #[ 0 1 2 3 4 5 6 7 8 9 ] ] ].
	stream := ZnPositionableReadStream on: data readStream.
	self should: [ stream position: 1 ] raise: SubscriptOutOfBounds.
	stream next: 100.
	self should: [ stream position: -1 ] raise: SubscriptOutOfBounds.
	self should: [ stream position: 101 ] raise: SubscriptOutOfBounds.
	stream next: 500.
	self should: [ stream position: 100 ] raise: SubscriptOutOfBounds.
	self should: [ stream position: 600 - stream bufferSize - 1 ] raise: SubscriptOutOfBounds.
	stream position: 400.
	stream next: 599.
	self assert: stream next equals: 9.
	self assert: stream atEnd