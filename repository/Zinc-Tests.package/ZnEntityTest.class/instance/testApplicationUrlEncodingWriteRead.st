testing
testApplicationUrlEncodingWriteRead
	| originalEntity bytes parsedEntity |
	originalEntity := ZnApplicationFormUrlEncodedEntity new.
	originalEntity
		at: 'Param1' put: 'ValueA';
		at: 'Param2' put: 'ValueB'.
	bytes := originalEntity asByteArray.
	parsedEntity := ZnEntity
		readFrom: bytes readStream
		usingType: ZnMimeType applicationFormUrlEncoded
		andLength: bytes size.
	self assert: (parsedEntity at: 'Param1') equals: 'ValueA'.
	self assert: (parsedEntity at: 'Param2') equals: 'ValueB'