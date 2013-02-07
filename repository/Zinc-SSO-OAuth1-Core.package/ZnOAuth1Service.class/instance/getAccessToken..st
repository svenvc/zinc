actions
getAccessToken: aToken
	"The final step: Use the token <aToken> that was authorized by the user to get the access token."

	^self getAccessToken: aToken verifier: nil