actions
executeRequest: aRequest token: anAccessToken followRedirects: aBoolean
	"Execute the HTTP request <aRequest>. Use <anAccessToken> to set the OAuth Authorization header."

	| calculator response |

	calculator := self providerAccount newCalculator.
	anAccessToken notNil
		ifTrue: [
			calculator 
				token: anAccessToken value;
				tokenSecret: anAccessToken secret ].
	
	aRequest setAuthorization: (calculator getAuthorizationHeader: aRequest).
	response := self httpClient 
		request: aRequest ;
		execute ;
		response.
	
	(aBoolean and: [ response isRedirect ])
		ifTrue: [ 
			| newRequest |
			newRequest := aRequest copy
				url: (response headers at: 'Location') ;
				yourself.
			^self executeRequest: newRequest token: anAccessToken ].
	^response