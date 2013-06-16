responses
ssoTwitterCallback: request

	| requestToken oauthToken oauthVerifier accessToken |

	requestToken := self twitterSessionFor: request 
		ifAbsent:  [ ^ self generateInvalidCallbackRequest ].

	oauthToken := request uri queryAt: 'oauth_token'.
	oauthVerifier := request uri queryAt: 'oauth_verifier'.
	
	(oauthToken isNil or: [ oauthVerifier isNil])
		ifTrue: [ ^ self generateInvalidCallbackRequest ].
		
	oauthToken = requestToken value
		ifFalse: [ ^ self generateInvalidCallbackRequest ].
	
	accessToken := self twitterOAuth1Service getAccessToken: requestToken verifier: oauthVerifier.
	self twitterSessionFor: request put: accessToken. 

	^ ZnResponse redirect: 'sso-twitter-data'