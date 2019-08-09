testing
testCharset
	| mimeType |
	mimeType := ZnMimeType textPlain.
	self assert: mimeType charSet equals: 'utf-8'.
	mimeType charSet: 'ascii'.
	self assert: mimeType charSet equals: 'ascii'.
	mimeType clearCharSet.
	self assert: mimeType charSet isNil.
	mimeType setCharSetUTF8.
	self assert: mimeType charSet equals: 'utf-8'