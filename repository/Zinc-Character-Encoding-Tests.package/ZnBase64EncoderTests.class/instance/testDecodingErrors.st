testing
testDecodingErrors
	| encoder |
	encoder := ZnBase64Encoder new.
	self should: [ encoder decode: 'A' ] raise: Error.
	self should: [ encoder decode: 'AB' ] raise: Error.
	self should: [ encoder decode: 'ABC' ] raise: Error.