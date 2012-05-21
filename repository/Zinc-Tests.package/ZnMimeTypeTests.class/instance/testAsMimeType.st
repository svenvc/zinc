testing
testAsMimeType
	self assert: 'text/plain' asZnMimeType = ZnMimeType textPlain.
	self assert: ZnMimeType applicationOctetStream asZnMimeType = ZnMimeType applicationOctetStream