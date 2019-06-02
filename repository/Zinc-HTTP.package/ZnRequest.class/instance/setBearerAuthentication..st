accessing
setBearerAuthentication: token
	token isNil
		ifTrue: [
			self headers removeKey: 'Authorization' ifAbsent: []]
		ifFalse: [
			self setAuthorization: 'Bearer ', token ]
