initialize-release
setDomain: aString

	| url response |
	
	domain := aString.
	
	"Getting the eindpoint for a Google Apps hosted domains works a little bit different. 
	See https://developers.google.com/google-apps/sso/openid_reference_implementation"

	url := 'https://www.google.com/accounts/o8/.well-known/host-meta?hd=', domain.
	response := self httpClient
		url: url ;
		get ;
		response.
	response isSuccess
		ifFalse: [ ZnOpenIDNoSuchDomain signal: domain ].
		
	discoveryUrl := response contents asString readStream 
		upTo: $< ;
		upTo: $>