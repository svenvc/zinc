public
signRequest: request
	| authorization |
	authorization := self authorizationFor: request.
	request
		setAuthorization:
			(String
				streamContents: [ :stream | 
					stream
						nextPutAll: 'AWS ';
						nextPutAll: self accessKeyId;
						nextPut: $:;
						nextPutAll: authorization ])