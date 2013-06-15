actions
seeAndValidate: aCFOpenIDNonce
	self removeOldNonces.
	aCFOpenIDNonce isOld
		ifTrue: [ ZnOpenIDNonceTooOldError signal ]
		ifFalse: [ 
			(nonces includes: aCFOpenIDNonce)
				ifTrue: [ ZnOpenIDNonceSeenError signal ]
				ifFalse: [ nonces add: aCFOpenIDNonce ] ]