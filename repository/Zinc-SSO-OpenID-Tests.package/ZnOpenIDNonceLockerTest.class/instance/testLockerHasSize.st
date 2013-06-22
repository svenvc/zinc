tests
testLockerHasSize
	| nonce |

	nonce := ZnOpenIDNonce new.
	locker seeAndValidate: nonce.
	self should: locker nonceCount = 1