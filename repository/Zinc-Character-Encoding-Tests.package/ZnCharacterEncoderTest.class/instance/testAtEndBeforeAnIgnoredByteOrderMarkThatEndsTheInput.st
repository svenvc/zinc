testing
testAtEndBeforeAnIgnoredByteOrderMarkThatEndsTheInput
	"A mark that ends the input is read as nothing, so the stream is at its end before it"

	self byteOrderMarkEncoders do: [ :encoder | | bytes |
		#( 'a<' 'a<<' '<a<' ) do: [ :pattern | | stream |
			bytes := encoder encodeString: (self withByteOrderMarks: pattern).
			stream := ZnCharacterReadStream on: bytes readStream encoding: encoder.
			self assert: (String streamContents: [ :out | [ stream atEnd ] whileFalse: [ out nextPut: stream next ] ]) equals: 'a'.
			stream := ZnCodePointReadStream on: bytes readStream encoding: encoder.
			self assert: (Array streamContents: [ :out | [ stream atEnd ] whileFalse: [ out nextPut: stream next ] ]) equals: #( 97 ).
			stream := ZnCharacterReadStream on: bytes readStream encoding: encoder.
			stream skip: 1.
			self assert: stream atEnd.
			self assert: stream next isNil.
			self assert: stream peek isNil ].
		bytes := encoder encodeString: (self withByteOrderMarks: '<').
		self assert: (ZnCharacterReadStream on: bytes readStream encoding: encoder) atEnd.
		self assert: (ZnCodePointReadStream on: bytes readStream encoding: encoder) atEnd ]