tests
testSameNonceIsNotAcceptedTwice

	| nonce |
	
	nonce := ZnOpenIDNonce new.
	self shouldnt: [ locker seeAndValidate: nonce ] raise: ZnOpenIDNonceSeenError.
	self should: [ locker seeAndValidate: nonce ] raise: ZnOpenIDNonceSeenError