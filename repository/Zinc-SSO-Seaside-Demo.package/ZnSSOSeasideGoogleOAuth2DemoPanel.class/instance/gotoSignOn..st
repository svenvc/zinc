actions
gotoSignOn: aCallbackUrl
	"Redirect to the Facebook sigon webpage."
	
	| state |
	
	oauthSession := (ZnOAuth2Session google: self oauthConsumerData)
		yourself.
		
	state := String streamContents: [ :stream |
		stream 
			nextPutAll: aCallbackUrl pathString ;
			nextPut: $? ;
			nextPutAll: aCallbackUrl queryString ].

	self requestContext
		redirectTo: (oauthSession authenticationUrlWithState: state) ;
		respond