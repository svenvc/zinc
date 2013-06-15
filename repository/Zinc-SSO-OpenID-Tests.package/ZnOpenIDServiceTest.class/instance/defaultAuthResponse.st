private
defaultAuthResponse
	^ ZnOpenIDAuthResponse new
		propertyAt: 'openid.op_endpoint' put: 'endpoint';
		propertyAt: 'openid.claimed_id' put: 'claimedid';
		propertyAt: 'openid.response_nonce' put: self generateValidNonce;
		propertyAt: 'openid.return_to' put: '123123123';
		propertyAt: 'openid.assoc_handle' put: '123123123';
		propertyAt: 'openid.sig' put: '123123123';
		propertyAt: 'openid.identity' put: '123123123';
		propertyAt: 'openid.signed' put: 'return_to,response_nonce,op_endpoint,assoc_handle,identity,claimed_id';
		yourself	"OpenID 2.0 / 10.1: identity is optional -> test that it doesn not have to be there.  "