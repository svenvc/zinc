testing
testNextFromStreamAnswersAByteOrderMarkThatEndsTheInput
	"A mark is skipped together with the character after it. At the end of the input there is none, so
	the mark is the answer. Readers of whole inputs drop it."

	self byteOrderMarkEncoders do: [ :encoder | | stream |
		stream := (encoder encodeString: (self withByteOrderMarks: '<a<')) readStream.
		self assert: (encoder nextFromStream: stream) equals: $a.
		self assert: (encoder nextFromStream: stream) equals: (Character value: 16rFEFF).
		self assert: stream atEnd ]