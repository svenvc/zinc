testing
testUTF16Forward
	"
	Ω -> 2 bytes (0x03A9)
	𐍈 -> 4 bytes (0xD800 0xDF48)
	"

	| encoder stream |
	encoder := ZnUTF16Encoder new.
	stream := (encoder encodeString: 'Ω𐍈') readStream.
	self assert: stream position equals: 0.
	encoder forwardOnStream: stream.
	self assert: stream position equals: 2.
	encoder forwardOnStream: stream.
	self assert: stream position equals: 6.
	self should: [ encoder forwardOnStream: stream ] raise: Error. "Fail if at the end."
	stream position: 4.
	self should: [ encoder forwardOnStream: stream ] raise: Error "Fail if in the middle of a character."