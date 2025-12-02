tests
testFormTest1
	| input request response contents |
	input := 'contents-' , 999 atRandom asString.
	request := ZnRequest post: '/form-test-1'.
	request url queryAt: 'input' put: input.
	response := ZnDefaultServerDelegate new handleRequest: request.
	self assert: response isSuccess.
	contents := response contents.
	self assert: (contents includesSubstring: input).