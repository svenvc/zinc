initialize-release
readFrom: stream
	| line reader |
	reader := ZnLineReader on: stream.
	[ (line := reader nextLine) isEmpty ] whileFalse: [
		self readOneHeaderFrom: line readStream ] 