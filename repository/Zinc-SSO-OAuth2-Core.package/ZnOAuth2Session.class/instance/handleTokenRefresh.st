public
handleTokenRefresh
	"Refresh my access token.
	
	See for details: https://tools.ietf.org/html/rfc6749#section-6"
	| tokenRequest client tokenResponse |
	
	tokenRequest  := (ZnRequest post: (ZnUrl fromString: self tokenEndpoint))
		entity: (ZnApplicationFormUrlEncodedEntity new
			at: 'grant_type' put: 'refresh_token';
			at: 'refresh_token' put: self refreshToken;
			at: 'client_id' put: self consumerData key;
			at: 'client_secret' put: self consumerData secret;
			yourself);
		yourself.

	client := ZnClient new.
	tokenResponse := [ 
		client request: tokenRequest;
			post ] ensure: [ client close ].

	self updateTokens: (ZnUtils defaultJSONReader fromString: tokenResponse).
