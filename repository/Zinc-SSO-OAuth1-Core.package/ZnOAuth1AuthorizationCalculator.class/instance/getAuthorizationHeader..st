api
getAuthorizationHeader: aRequest
	"Create the OAuth1 Authorization header. See: http://code.google.com/apis/accounts/docs/OAuth_ref.html "

	| oauthParameters baseString signatureKey encoder |
	
	oauthParameters := self getOAuthParameters.
	baseString := self getBaseString: aRequest with: oauthParameters.
	signatureKey := self getSignatureKey.
	encoder := ZnPercentEncoder new.
	
	self signatureMethod = 'HMAC-SHA1'
		ifTrue: [
			oauthParameters add: 'oauth_signature' -> (self class signStringSHA1: baseString usingSecret: signatureKey) ]
		ifFalse: [
			self error: 'Unsupported signature method' ].
		
	^String streamContents: [ :stream |
		stream nextPutAll: 'OAuth '.
		oauthParameters 
			do: [ :assoc |
				stream
					nextPutAll: assoc key ;
					nextPutAll: '="'.
				encoder encode: assoc value readStream to: stream.
				stream nextPutAll: '"' ]
			separatedBy: [ stream nextPutAll: ',' ] ]