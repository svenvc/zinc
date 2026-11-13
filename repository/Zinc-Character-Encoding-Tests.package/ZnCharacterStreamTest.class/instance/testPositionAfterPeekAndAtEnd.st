tests
testPositionAfterPeekAndAtEnd
	"A peeked character is not read yet: the byte position stays before it, whatever its encoded size"

	| euro text stream |
	euro := Character value: 16r20AC.
	text := 'a' , (String with: euro) , 'b'.
	#( 'utf8' 'utf16' 'utf32' ) do: [ :name | | encoder bytes |
		encoder := ZnCharacterEncoder newForEncoding: name.
		bytes := encoder encodeString: text.
		stream := ZnCharacterReadStream on: bytes readStream encoding: name.
		self assert: stream next equals: $a.
		self assert: stream position equals: (encoder encodedByteCountFor: $a).
		self assert: stream peek equals: euro.
		self assert: stream position equals: (encoder encodedByteCountFor: $a).
		self deny: stream atEnd.
		self assert: stream position equals: (encoder encodedByteCountFor: $a).
		self assert: stream next equals: euro.
		self assert: stream position equals: bytes size - (encoder encodedByteCountFor: $b).
		stream := ZnCodePointReadStream on: bytes readStream encoding: name.
		stream next; peek.
		self assert: stream position equals: (encoder encodedByteCountFor: $a) ]