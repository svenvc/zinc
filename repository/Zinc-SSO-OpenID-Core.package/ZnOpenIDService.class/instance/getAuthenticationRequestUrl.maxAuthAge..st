actions
getAuthenticationRequestUrl: aReturnToUrlString maxAuthAge: maxAgeInSecs
	"Answer a URL to the OpenID authentication page."
	
	^self getAuthenticationRequestUrl: aReturnToUrlString do: [ :request | 
		request papeMaxAuthAge: maxAgeInSecs ]