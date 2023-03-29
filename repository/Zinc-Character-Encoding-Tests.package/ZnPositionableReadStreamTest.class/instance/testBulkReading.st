tests
testBulkReading
	| stream buffer |
	stream := ZnPositionableReadStream on: #(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15) readStream.
	buffer := Array new: 6.
	self assert: (stream readInto: buffer startingAt: 1 count: 6) equals: 6.
	self assert: buffer equals: #(0 1 2 3 4 5).
	self assert: (stream readInto: buffer startingAt: 4 count: 3) equals: 3.
	self assert: (stream readInto: buffer startingAt: 1 count: 3) equals: 3.
	self assert: buffer equals: #(9 10 11 6 7 8).
	buffer atAllPut: 0.
	self assert: (stream readInto: buffer startingAt: 1 count: 6) equals: 4.
	self assert: buffer equals: #(12 13 14 15 0 0)