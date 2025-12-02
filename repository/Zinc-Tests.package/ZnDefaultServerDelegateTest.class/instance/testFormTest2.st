tests
testFormTest2
	| input entity request response contents |
	input := 'contents-' , 999 atRandom asString.
	request := ZnRequest post: '/form-test-2'.
	entity := ZnApplicationFormUrlEncodedEntity new.
	entity at: 'input' put: input.
	request entity: entity.
	response := ZnDefaultServerDelegate new handleRequest: request.
	self assert: response isSuccess.
	contents := response contents.
	self assert: (contents includesSubstring: input).