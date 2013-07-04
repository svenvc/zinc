I am ZnOAuth2Session, representing server side state tracking an OAuth2 session.

consumerData  
	- needed to setup an authentication request with a provider
	
accessToken
	- the result of a successful authentication
	
scopes
	- collection of strings representing the permissions 	
	
redirectUrl
	- the URL needed by the provider to get back to us

tokenType
	- Indicates the type of token returned (not really used yet). 
	
refreshToken 
	- a token that may be used to obtain a new access token. This field is only present if access_type=offline is included in the authorization code request (currently only used by Google).