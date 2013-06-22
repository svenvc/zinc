tests
testTooOldNodesAreNotPolledAllTheTime
	| nonce1 nonce2 |

	nonce1 := ZnOpenIDNonceDummy new.
	nonce2 := nonce1 copy.
	self shouldnt: [ locker seeAndValidate: nonce1  ] raise: ZnOpenIDNonceSeenError.
	locker resetRemovalTime.
	nonce1 makeOld.
	self shouldnt: [ locker seeAndValidate: nonce2 ] raise: ZnOpenIDNonceSeenError.
	self
		shouldnt: [ 
			locker
				seeAndValidate:
					(ZnOpenIDNonce new
						distinctor: 1;
						yourself) ]
		raise: ZnOpenIDNonceSeenError.
	self assert: nonce2 callCountOfIsOld = 1