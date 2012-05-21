private
linkCredentials
	(self session credentialsForUrl: self url) do: [ :cred |
		cred linkToAuthRequest: self response wwwAuthenticate ]