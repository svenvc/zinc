testing
testDefaultJSONReader
	"System should provide a JSON parser"
	| reader expectedParserClass |
	reader := ZnUtils defaultJSONReader.
	expectedParserClass := self class environment at: #NeoJSONObject ifAbsent: [
		          self class environment at: #STONJSON ifAbsent:[nil]].

	self assert: reader isNotNil.
	self assert: reader equals: expectedParserClass