testing
testAssociationResponse

	| input response |
	
	input := self associationResult .
	response := ZnOpenIDAssociationResponse newFromKeyValueForm: input.
	
	self assert: response isHmacSHA1.
	self assert: (response sign: 'my-data' andCheck: 'Crc335ANSwfLu+qcCYMkYRbXbew=').
	
	self deny: (response sign: 'my-data' andCheck: 'INVALID=')
	
	
