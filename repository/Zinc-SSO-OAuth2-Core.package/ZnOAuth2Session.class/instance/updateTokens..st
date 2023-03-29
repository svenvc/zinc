parsing
updateTokens: tokenData
	"Update tokens from dictionary, signalling authentication error when present."

	(tokenData includesKey: 'error')
		ifTrue: [ ZnAuthError signal: (tokenData at: 'error') asString ].

	accessToken := tokenData at: 'access_token'.
	tokenType := tokenData at: 'token_type' ifAbsent:[ 'Bearer' ]. "Bearer is the default type on most implementation, sometimes the auth server not always respond with the type"
	(tokenData includesKey: 'expires_in')
		ifTrue: [ self updateExpiration: (tokenData at: 'expires_in') ].
	(tokenData includesKey: 'refresh_token')
		ifTrue: [ refreshToken := tokenData at: 'refresh_token' ]
