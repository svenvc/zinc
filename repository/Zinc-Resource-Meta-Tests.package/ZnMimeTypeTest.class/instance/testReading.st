testing
testReading

	| mimeType |

	mimeType := ZnMimeType fromString: 'text/plain; charset=utf-8'.
	self assert: mimeType main equals: 'text'.
	self assert: mimeType sub equals: 'plain'.
	self assert: mimeType charSet equals: 'utf-8'.
	self assert: mimeType isCharSetUTF8.
	self assert: mimeType isBinary not