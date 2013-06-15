private
generateValidNonce
	^ self encodeNonceFromTime: self currentTime andDiscriminator: ''