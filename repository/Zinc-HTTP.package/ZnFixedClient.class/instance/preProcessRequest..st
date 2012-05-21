private
preProcessRequest: request
	(username notNil and: [ password notNil ]) ifTrue: [
		request setBasicAuthenticationUsername: username password: password ]