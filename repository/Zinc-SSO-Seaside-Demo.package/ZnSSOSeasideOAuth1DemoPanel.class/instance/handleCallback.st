actions
handleCallback
	"Hanlde the callback from the OAuth provider. If the client approved our request
	we can now get the access token." 

	| request token verifier |

	request := self requestContext request.

	token := request at: 'oauth_token'.
	verifier := request at: 'oauth_verifier'.
	
	(token isNil or: [ verifier isNil])
		ifTrue: [ ^self ].
		
	token = self requestToken value
		ifFalse: [ self error: 'Invalid token value' ].
	
	self accessToken: (self oauthService getAccessToken: self requestToken verifier: verifier)