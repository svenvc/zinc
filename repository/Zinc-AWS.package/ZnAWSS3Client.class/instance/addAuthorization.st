private protocol
addAuthorization
	| authorization |
	authorization := self authorizationFor: self httpClient request.
	self httpClient 
		headerAt: 'Authorization' 
		put: (String streamContents: [ :stream |
				stream nextPutAll: 'AWS '; nextPutAll: self accessKeyId; nextPut: $:; nextPutAll: authorization ]).


