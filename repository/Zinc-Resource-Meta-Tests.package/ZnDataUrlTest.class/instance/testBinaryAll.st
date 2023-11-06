tests
testBinaryAll
	| dataUrl |
	dataUrl := ZnDataUrl new.
	dataUrl data: (0 to: 255) asByteArray.
	dataUrl mediaType: ZnMimeType applicationOctetStream.
	dataUrl base64Encoded: true.
	self assert: dataUrl data equals: (0 to: 255) asByteArray.
	self assert: dataUrl isBase64Encoded.
	self assert: dataUrl mediaType equals: ZnMimeType applicationOctetStream.
	self assert: (ZnDataUrl fromString: dataUrl printString) data equals: (0 to: 255) asByteArray