tests
testClaimedIdIsValidatedWrongEndpoint
	| response service |
	response := self defaultAuthResponse.
	service := ZnOpenIDServiceDummy new
		doNotCheckSignature ;
		provider: self dummyProvider ;
		claimedId: response claimedId
			xrds: (self generateSimpleXrdsForEndpoint: 'endoint123' andLocalId: '123123').

	self should: [ service validateAuthResponse: response ] raise: ZnOpenIDClaimedIDVerificationError