conversions
encodeBase64: string
	^ (Base64MimeConverter respondsTo: #mimeEncode:multiLine:)
		ifTrue: [ 
			(Base64MimeConverter mimeEncode: string readStream multiLine: false) contents ]	
		ifFalse: [ 
			(Base64MimeConverter mimeEncode: string readStream) contents 
				reject: [ :each | each = Character cr ] ]