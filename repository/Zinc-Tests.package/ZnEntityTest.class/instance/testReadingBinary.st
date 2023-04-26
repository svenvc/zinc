testing
testReadingBinary
	| contents entity |
	contents := 'This is a test'.
	entity := ZnEntity
				readBinaryFrom: contents asByteArray readStream
				usingType: ZnMimeType textPlain
				andLength: contents size.
	self deny: entity contents isString.
	self assert: entity contents equals: contents asByteArray.
	self assert: entity contentLength equals: contents size.
	self assert: entity contentType equals: ZnMimeType textPlain