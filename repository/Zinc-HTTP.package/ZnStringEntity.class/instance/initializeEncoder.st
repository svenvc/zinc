private
initializeEncoder
	| charSet newEncoder |
	self hasEncoder ifTrue: [ ^ self ].
	newEncoder := (charSet := contentType charSet) isNil
		ifTrue: [ ZnNullEncoder new ]
		ifFalse: [ ZnCharacterEncoder newForEncoding: charSet ].
	self encoder: newEncoder