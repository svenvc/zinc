private
computeContentLength
	self string isNil ifTrue: [ ^ self ].
	self initializeEncoder.
	contentLength := encoder encodedByteCountForString: string