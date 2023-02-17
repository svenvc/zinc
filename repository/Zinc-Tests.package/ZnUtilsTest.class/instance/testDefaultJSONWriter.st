testing
testDefaultJSONWriter
	"System should provide a JSON parser"
	| writer expectedParserClass |
	writer := ZnUtils defaultJSONWriter.
	expectedParserClass := self class environment at: #NeoJSONWriter ifAbsent: [
		          self class environment at: #STONJSON ifAbsent:[nil]].

	self assert: writer notNil.
	self assert: writer equals: expectedParserClass