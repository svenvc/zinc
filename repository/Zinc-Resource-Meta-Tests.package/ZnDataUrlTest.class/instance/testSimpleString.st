tests
testSimpleString
	| dataUrl |
	dataUrl := ZnDataUrl new.
	dataUrl data: 'foo'.
	self assert: dataUrl data equals: 'foo'