accessing
parseString: aByteString
	"Parses nonce that is format YYYY-MM-DD'T'HH:mm:SS'Z'Distinctor for example
	2011-11-23T11:48:19Z
	2011-11-23T11:48:19Zasdas123123
	
	"

	| timestampPart |
	
	[ 
	timestampPart := aByteString copyFrom: 1 to: 20.
	aByteString size > 22
		ifTrue: [ self distinctor: (aByteString allButFirst: 20). ].
	self timestamp: (self class decodeRFC3339Date: timestampPart) ]
		on: Error
		do: [ ZnOpenIDNonceInvalidError signal: aByteString ]