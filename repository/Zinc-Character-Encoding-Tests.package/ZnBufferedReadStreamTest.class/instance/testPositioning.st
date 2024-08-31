tests
testPositioning
	| byteArray stream |

	byteArray := (1 to: 255) as: ByteArray.

	stream := ZnBufferedReadStream on: byteArray readStream.
	stream sizeBuffer: 32.

	self assert: stream position equals: 0.
	self assert: stream next equals: 1.
	self assert: stream position equals: 1.

	self assert: (stream next: 100) equals: ((2 to: 101) as: ByteArray).
	self assert: stream position equals: 101.

	stream position: 99.
	self assert: stream position equals: 99.
	
	self assert: stream next equals: 100.
	self assert: stream position equals: 100