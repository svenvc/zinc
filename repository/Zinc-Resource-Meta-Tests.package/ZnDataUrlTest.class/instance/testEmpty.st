tests
testEmpty
	| dataUrl |
	dataUrl := ZnDataUrl new.
	self assert: dataUrl isEmpty.
	self assert: dataUrl scheme equals: #data.
	self assert: ('text/plain' asZnMimeType matches: dataUrl mediaType).
	self assert: dataUrl equals: ZnDataUrl new