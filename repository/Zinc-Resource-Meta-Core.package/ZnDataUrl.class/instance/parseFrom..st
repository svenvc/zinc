parsing
parseFrom: string
	| commaIndex |
	(string beginsWith: 'data:')
		ifFalse: [ ^ self error: 'missing data: scheme' ].
	(commaIndex := string indexOf: $,) isZero
		ifTrue: [ ^ self error: 'missing comma in data: scheme' ].
	commaIndex = string size 
		ifTrue: [ ^ self ].
	commaIndex > 7
		ifTrue: [ mediaType := ZnMimeType fromString: (string copyFrom: 6 to: commaIndex - 1) ].
	(base64Encoded := mediaType parameters includesKey: 'base64')
		ifTrue: [ 
			 mediaType removeParameter: 'base64' ].
	data := string copyFrom: commaIndex + 1 to: string size.
	data := base64Encoded 
		ifTrue: [ 
			ZnBase64Encoder new
				decode: data ]
		ifFalse: [
			ZnPercentEncoder new 
				characterEncoder: mediaType charSet asZnCharacterEncoder;
				decode:	data ]