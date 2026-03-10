tests
testNextLineWithDifferentLineTerminators
	| reader stream actual |
	"A stream with a Unix-style LF followed by an old Mac CR and followed by standard CRLF"
	stream := ('abc' , String lf , 'def' , String cr , 'ghi' , String crlf , 'jkl') readStream.
	reader := ZnLineReader on: stream.

	actual := reader nextLine.
	self assert: actual equals: 'abc'.
	actual := reader nextLine.
	self assert: actual equals: 'def'.
	actual := reader nextLine.
	self assert: actual equals: 'ghi'.
	actual := reader nextLine.
	self assert: actual equals: 'jkl'.
	actual := reader nextLine.
	self assert: actual equals: ''