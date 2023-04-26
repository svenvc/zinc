tests
testSetToEnd
	| stream source |
	source := '0123456789'.
	stream := ZnBufferedReadStream on: source readStream.
	stream sizeBuffer: source size.

	"Call setToEnd on new stream"
	self assert: stream position equals: 0.
	stream setToEnd.
	self assert: stream position equals: source size.

	"Call setToEnd without after reading some elements"
	stream position: 2.
	self assert: (stream next: 4) equals: '2345'.
	stream setToEnd.
	self assert: stream position equals: source size