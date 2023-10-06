tests
testGreek
	| dataUrl |
	dataUrl := ZnDataUrl fromString: 'data:text/plain;charset=iso-8859-7,%e1%f8%e2'.
	self assert: dataUrl data equals: 'αψβ'.
	self deny: dataUrl isBase64Encoded.
	self assert: (dataUrl printString sameAs: 'data:text/plain;charset=iso-8859-7,%e1%f8%e2')