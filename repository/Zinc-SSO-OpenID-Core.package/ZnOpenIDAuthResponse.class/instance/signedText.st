accessing openid
signedText
	"Return the text on which the signature is applied."

	| signedParams text param |
	
	signedParams := self signed readStream.
	text := WriteStream on: String new.
	[ signedParams atEnd ] whileFalse: [
		param := signedParams upTo: $,.
		text 
			nextPutAll: param; 
			nextPut: $:; 
			nextPutAll: (self propertyAt: 'openid.', param);
			nextPut: Character lf].
	^text contents
