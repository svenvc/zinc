accessing
contentLength

	contentLength ifNil: [ self computeRepresentation ].
	^ contentLength