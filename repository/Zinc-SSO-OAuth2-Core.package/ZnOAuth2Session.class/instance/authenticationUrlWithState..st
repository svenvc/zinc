public
authenticationUrlWithState: stateString
	"Answer an url to be used in an Authorization Request for an Authorization Code Grant flow.
	Subclasses can override this method and add additional query parameters.

	See for details: https://tools.ietf.org/html/rfc6749#section-4.1"

	^ (ZnUrl fromString: self authorizationEndpoint)
		queryAt: 'response_type' put: 'code';
		queryAt: 'client_id' put: self consumerData key;
		queryAt: 'redirect_uri' put: self redirectUrl;
		queryAt: 'scope' put: self scopeParameter;
		queryAt: 'state' put: stateString;
		yourself