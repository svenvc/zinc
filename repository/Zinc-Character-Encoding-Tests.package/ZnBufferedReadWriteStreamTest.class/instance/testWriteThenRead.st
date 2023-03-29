tests
testWriteThenRead
	| stream stringStream |

	((SystemVersion current major < 7) or: [ SystemVersion current build < 690 ])
		ifTrue: [ ^ self skip ].

	stringStream := ReadWriteStream with: '0123456789' copy.
	stringStream reset.
	stream := ZnBufferedReadWriteStream on: stringStream.
	stream sizeBuffer: 8.

	stream nextPutAll: 'ABCD'.

	self assert: stream peek equals: $4.
	self assert: stream position equals: 4.
	self assert: stream upToEnd equals: '456789'.
	self assert: stream position equals: 10.
	self assert: stream atEnd.

	self assert: stringStream contents equals: 'ABCD456789'