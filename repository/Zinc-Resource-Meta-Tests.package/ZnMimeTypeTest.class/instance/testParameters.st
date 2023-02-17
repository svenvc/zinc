testing
testParameters
	| mimeType |
	mimeType := ZnMimeType main: 'text' sub: 'plain'.
	self should: [ mimeType parameterAt: 'foo' ] raise: KeyNotFound.
	self assert: (mimeType parameterAt: 'foo' ifAbsent: [ #none ]) equals: #none.
	mimeType parameterAt: 'foo' put: '1'.
	self assert: (mimeType parameterAt: 'foo') equals: '1'.
	self assert: (mimeType parameterAt: 'foo' ifAbsent: [ #none ]) equals: '1'.
	mimeType removeParameter: 'foo'.
	mimeType removeParameter: 'bar'.
	self should: [ mimeType parameterAt: 'foo' ] raise: KeyNotFound.
	self assert: (mimeType parameterAt: 'foo' ifAbsent: [ #none ]) equals: #none