private
computeContentLength

	self string ifNil: [ ^ self ].
	contentLength := self encoder encodedByteCountForString: string