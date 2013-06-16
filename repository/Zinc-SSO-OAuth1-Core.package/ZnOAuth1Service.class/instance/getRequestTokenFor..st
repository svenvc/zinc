actions
getRequestTokenFor: aCallbackUrl
	"The first step is to get a token and token_secret for <aCallbackUrl>."

	^self getRequestTokenFor: aCallbackUrl with: nil