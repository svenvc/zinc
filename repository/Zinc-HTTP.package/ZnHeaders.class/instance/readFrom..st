initialize-release
readFrom: stream
	| line reader |
	reader := ZnLineReader on: stream.
	[ (line := reader nextLine) isEmpty ] whileFalse: [ | key |
		key := self readOneHeaderFrom: line readStream.
		"Continuation header lines start with a space or tab"
		[ stream atEnd not and: [ #(32 9) asByteArray includes: stream peek ] ]
			whileTrue: [
				self extendHeaderAt: key from: reader nextLine ] ]