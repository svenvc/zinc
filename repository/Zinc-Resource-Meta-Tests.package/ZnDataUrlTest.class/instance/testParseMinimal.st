tests
testParseMinimal
	| dataUrl |
	dataUrl := ZnDataUrl fromString: 'data:,'.
	self assert: dataUrl isEmpty.
	self assert: dataUrl scheme equals: #data.
	self assert: ('text/plain' asZnMimeType matches: dataUrl mediaType).