tests
testValidateResponseAcceptsNonceInOnlyInCertainTimeFrame
	| response service nonce |
	nonce := self encodeNonceFromTime: self currentTime - 2 minutes andDiscriminator: '123'.
	ZnOpenIDNonceLocker 
		reset;
		acceptedTimeFrame: 1 minute.
	response := self defaultAuthResponse
		propertyAt: 'openid.response_nonce' put: nonce;
		yourself.
	service := ZnOpenIDServiceDummy new
		doNotValidateEndpoint ;
		doNotCheckSignature ;
		provider: self dummyProvider ;
		yourself.

	self should: [ service validateAuthResponse: response ] raise: ZnOpenIDNonceTooOldError