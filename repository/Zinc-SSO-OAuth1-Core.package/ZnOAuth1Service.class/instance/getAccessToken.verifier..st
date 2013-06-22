actions
getAccessToken: aToken verifier: aVerifier
	"The final step: Use the token <aToken> that was authorized by the user to get the access token."

	| calculator request response responseProperties |
	
	calculator := self providerAccount newCalculator
		token: aToken value ;
		tokenSecret: aToken secret ;
		verifier: aVerifier ;
		yourself.

	request := ZnRequest get: self providerAccount getAccessTokenUrl.
	request
		setAccept: '*/*' ;
		setAuthorization: (calculator getAuthorizationHeader: request).

	response := self httpClient
		request: request ;
		execute ;
		response.
	
	response isSuccess 
		ifFalse: [ self error: 'Invalid response' ].

	responseProperties := response contents.
	responseProperties isString
		ifTrue: [ responseProperties := self resourceMetaUtils parseQueryFrom: responseProperties readStream ].

	^self providerAccount accessTokenClass newFromDictionary: responseProperties 