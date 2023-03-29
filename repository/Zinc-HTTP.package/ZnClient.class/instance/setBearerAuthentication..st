accessing - request
setBearerAuthentication: token
	"Set the bearer token for authentication (e.g. OAuth 2.0) for the current request."

	self request setBearerAuthentication: token