actions
getRequestToken
	"The first step is to get a token and token_secret. Use this mthod only with OAuth 1.0 providers.
	OAuth version 1.0a requires a callback url."

	^self getRequestTokenFor: nil with: nil