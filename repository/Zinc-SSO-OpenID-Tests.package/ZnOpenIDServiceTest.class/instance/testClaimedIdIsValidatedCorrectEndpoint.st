tests
testClaimedIdIsValidatedCorrectEndpoint
	| response service |
	response := self defaultAuthResponse.
	service := ZnOpenIDServiceDummy new.
	service
		doNotValidateEndpoint ;
		doNotCheckSignature;
		provider: self dummyProvider ;		
		claimedId: response claimedId
			xrds:
				'<xrds:XRDS xmlns="xri://$xrd*($v*2.0)" xmlns:xrds="xri://$xrds"><XRD><Service priority="0"><Type>http://specs.openid.net/auth/2.0/signon</Type><URI>endpoint</URI><LocalID>123123123</LocalID></Service></XRD></xrds:XRDS>'.

	self shouldnt: [ service validateAuthResponse: response ] raise: ZnOpenIDClaimedIDVerificationError