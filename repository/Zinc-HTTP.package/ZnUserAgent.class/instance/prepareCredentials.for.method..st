private-protocol
prepareCredentials: headers for: urlObject method: method
	(self session credentialsForUrl: urlObject) do: [ :cred |
		cred isComplete ifTrue: [
			[ cred setAuthorizationHeader: headers for: urlObject method: method ]
				on: Error
				do: self errorHandler ] ]
	