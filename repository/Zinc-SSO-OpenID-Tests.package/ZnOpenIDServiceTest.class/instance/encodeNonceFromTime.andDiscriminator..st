private
encodeNonceFromTime: dateTime andDiscriminator: aString
	^ (ZnOpenIDNonce encodeRFC3339Date: dateTime) , aString.