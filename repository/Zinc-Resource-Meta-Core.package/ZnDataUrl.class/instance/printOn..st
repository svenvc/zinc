printing
printOn: stream
	stream nextPutAll: 'data:'.
	mediaType printOn: stream.
	base64Encoded
		ifTrue: [ 
			stream nextPutAll: ';base64,'.
			ZnBase64Encoder new 
				encode: data readStream to: stream ]
		ifFalse: [
			stream nextPut: $,.
			ZnPercentEncoder new 
				characterEncoder: mediaType charSet asZnCharacterEncoder;
				encode: data readStream to: stream ]