I am ZnOAuth2Session, representing server side state tracking an OAuth2 session.

consumerData  
	- needed to setup an authentication request with a provider
	
accessToken
	- the result of a successful authentication
	
scopes
	- collection of strings representing the permissions 
	
redirectUrl
	- the URL needed by the provider to get back to us
