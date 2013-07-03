public
authenticationUrlWithState: aStateString

	| authUrl |

	authUrl := (ZnUrl fromString: 'https://accounts.google.com/o/oauth2/auth')
		queryAt: 'response_type' put: 'code' ;
		queryAt: 'client_id' put: self consumerData key ;
		queryAt: 'redirect_uri' put: self redirectUrl ;
		queryAt: 'scope' put: self scopeParameter ;
		queryAt: 'state' put: aStateString ;
		queryAt: 'access_type' put: self accessType ;
		yourself.

	self isForceApprovalPrompt
		ifTrue: [ authUrl queryAt: 'approval_prompt' put: 'force' ].
		
	^authUrl