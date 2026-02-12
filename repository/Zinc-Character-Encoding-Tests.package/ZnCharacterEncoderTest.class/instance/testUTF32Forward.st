testing
testUTF32Forward
	"All characters are on 4 bytes"

	| encoder stream |
	encoder := ZnUTF32Encoder new.
	stream := (encoder encodeString: 'té') readStream.
	self assert: stream position equals: 0.
	encoder forwardOnStream: stream.
	self assert: stream position equals: 4.
	encoder forwardOnStream: stream.
	self assert: stream position equals: 8.
	self should: [ encoder forwardOnStream: stream ] raise: Error. "Fail if at the end."
	stream position: 7.
	self should: [ encoder forwardOnStream: stream ] raise: Error