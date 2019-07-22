accessing
contentLength

	contentLength ifNil: [ self computeContentLength ].
	^ contentLength