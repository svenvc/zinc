testing
testUTF8Forward
	"
	A -> 1 byte
	¢ -> 2 bytes
	€ -> 3 bytes
	𝄞 -> 4 bytes
	"

	| encoder stream |
	encoder := ZnUTF8Encoder new.
	stream := (encoder encodeString: 'A¢€𝄞') readStream.
	self assert: stream position equals: 0.
	encoder forwardOnStream: stream.
	self assert: stream position equals: 1.
	encoder forwardOnStream: stream.
	self assert: stream position equals: 3.
	encoder forwardOnStream: stream.
	self assert: stream position equals: 6.
	encoder forwardOnStream: stream.
	self assert: stream position equals: 10.
	self should: [ encoder forwardOnStream: stream ] raise: Error. "Fail if at the end."
	stream position: 7.
	self should: [ encoder forwardOnStream: stream ] raise: Error "Fail if in the middle of a character."