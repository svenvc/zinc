public
authenticationUrlWithState: stateString
	"Add access_type and prompt parameters for Google OAuth 2.0."

	^ (super authenticationUrlWithState: stateString)
		queryAt: 'access_type' put: self accessType;
		queryAt: 'prompt' put: self prompt;
		yourself