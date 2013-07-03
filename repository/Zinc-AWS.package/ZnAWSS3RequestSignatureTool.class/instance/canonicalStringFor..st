private
canonicalStringFor: request
	^ String streamContents: [ :stream |
		stream nextPutAll: request method; lf.
		(request headers includesKey: 'Content-MD5')
			ifTrue: [ stream nextPutAll: (request headers at: 'Content-MD5') ].
		stream lf.
		request headers hasContentType ifTrue: [
			stream print: request headers contentType ].
		stream lf.
		(request headers includesKey: 'Date')
			ifTrue: [ stream nextPutAll: (request headers at: 'Date') ].
		stream lf.
		self printAmzHeaders: request headers to: stream.
		stream 
			nextPutAll: (self bucketFromEndPoint: request uri host); 
			nextPutAll: request uri pathPrintString ]