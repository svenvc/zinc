testing
testSimple
	| input reader |
	input := 'Foo' , String crlf , 'Bar' , String crlf.
	reader := ZnLineReader on: input readStream.
	self assert: reader nextLine equals: 'Foo'.
	self assert: reader nextLine equals: 'Bar'.
	self assert: reader nextLine isEmpty