testing
testLossyUTF8Random
	| bytes string |
	bytes := ((1 to: 10000) collect: [ :_ | 256 atRandom - 1 ]) asByteArray.
	string := bytes decodeWith: ZnLossyUTF8Encoder new.
	self assert: string isString