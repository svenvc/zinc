testing
testNullEncoder

	| encoder bytes string |
	encoder := ZnNullEncoder new.
	bytes := self encodeString: 'abc' with: encoder.
	self assert: bytes equals: #( 97 98 99 ) asByteArray.
	string := self decodeBytes: #( 65 66 67 ) asByteArray with: encoder.
	self assert: string equals: 'ABC'