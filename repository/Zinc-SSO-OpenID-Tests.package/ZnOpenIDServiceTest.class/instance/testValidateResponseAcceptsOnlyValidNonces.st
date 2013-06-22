tests
testValidateResponseAcceptsOnlyValidNonces
	| response service |
	response := self defaultAuthResponse
		propertyAt: 'openid.response_nonce' put: '123123123';
		yourself.
	service := ZnOpenIDServiceDummy new
		doNotValidateEndpoint ;
		doNotCheckSignature ;
		provider: self dummyProvider ;
		yourself.

	self should: [ service validateAuthResponse: response ] raise: ZnOpenIDNonceInvalidError