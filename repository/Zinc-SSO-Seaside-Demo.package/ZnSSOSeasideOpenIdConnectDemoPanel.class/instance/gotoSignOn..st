actions
gotoSignOn: aCallbackUrl
	"Redirect to the sigon webpage."
	
	| state |
	
	state := String streamContents: [ :stream |
		stream 
			nextPutAll: aCallbackUrl pathString ;
			nextPut: $? ;
			nextPutAll: aCallbackUrl queryString ].

	self requestContext
		redirectTo: (ssoSession authenticationUrlWithState: state) ;
		respond