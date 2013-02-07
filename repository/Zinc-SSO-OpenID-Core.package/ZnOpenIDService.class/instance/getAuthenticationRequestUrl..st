actions
getAuthenticationRequestUrl: aReturnToUrlString
	"Answer a URL to the OpenID authentication page."
	
	^self getAuthenticationRequestUrl: aReturnToUrlString do: [ :request | 
		request axRequestNamesAndEmail ]