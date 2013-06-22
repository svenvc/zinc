tests
testValidateResponseAcceptsSameNonceOnlyOnceForSameProvider
	| response service |
	response := self defaultAuthResponse.
	service := ZnOpenIDServiceDummy new
		doNotValidateEndpoint ;
		doNotCheckSignature ;
		provider: self dummyProvider ;
		yourself.

	self shouldnt: [ service validateAuthResponse: response ] raise: ZnOpenIDNonceSeenError.
	self should: [ service validateAuthResponse: response ] raise: ZnOpenIDNonceSeenError