accessing
setBearerAuthentication: token

	token
		ifNil: [ self headers removeKey: 'Authorization' ifAbsent: [  ] ]
		ifNotNil: [ self setAuthorization: 'Bearer ' , token ]