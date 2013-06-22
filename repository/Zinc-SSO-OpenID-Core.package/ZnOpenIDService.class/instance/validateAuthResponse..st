actions
validateAuthResponse: anAuthResponse
	"Validate the authentication response. Raise an error when something is wrong."

	| signedFields requiredFields |

	anAuthResponse opEndpoint isNil
		ifTrue: [ self authenticationError: 'openid.op_endpoint is required in OpenID auth responses' ].
	anAuthResponse claimedId isNil
		ifTrue: [ self authenticationError: 'openid.clamied_id must be present in OpenID2 auth responses' ].
	anAuthResponse responseNonce isNil
		ifTrue: [ self authenticationError: 'openid.response_nonce is required in OpenID2 auth responses' ].
	signedFields := anAuthResponse signed subStrings: ','.
	requiredFields := #( 'return_to' 'response_nonce' 'op_endpoint' 'assoc_handle' 'identity' 'claimed_id' ).
	requiredFields
		do: [ :each | 
			(signedFields includes: each)
				ifFalse: [ self authenticationError: each , ' must be signed' ] ].
	(self associationResponse sign: anAuthResponse signedText andCheck: anAuthResponse sig)
		ifFalse: [ self authenticationError: 'signature mismatch' ].

	self provider shouldValidateClaimedIdBelongsToEndpoint
		ifTrue: [ self validateClaimedId: anAuthResponse claimedId belongsToEndpoint: anAuthResponse opEndpoint ].
		
	self provider nonceLocker seeAndValidate: (ZnOpenIDNonce fromString: anAuthResponse responseNonce)