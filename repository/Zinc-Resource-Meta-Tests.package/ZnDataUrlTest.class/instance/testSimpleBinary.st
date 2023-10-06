tests
testSimpleBinary
	| dataUrl |
	dataUrl := ZnDataUrl new.
	dataUrl data: #[ 0 1 2 3 4 5 6 7 8 9 ].
	dataUrl mediaType: ZnMimeType applicationOctetStream.
	dataUrl base64Encoded: true.
	self assert: dataUrl data equals: #[ 0 1 2 3 4 5 6 7 8 9 ].
	self assert: dataUrl isBase64Encoded.
	self assert: dataUrl mediaType equals: ZnMimeType applicationOctetStream