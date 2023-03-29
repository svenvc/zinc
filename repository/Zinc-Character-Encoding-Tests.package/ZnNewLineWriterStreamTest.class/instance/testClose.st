tests
testClose
	| string result znstream |
	string := 'abcčřž' , String cr.
	result := String streamContents: [ :out |
		znstream := ZnNewLineWriterStream on: (ZnBufferedWriteStream on: out).
		znstream forLf.
		znstream nextPutAll: string.
		znstream close ].
	string at: string size put: Character lf.
	self assert: result equals: string