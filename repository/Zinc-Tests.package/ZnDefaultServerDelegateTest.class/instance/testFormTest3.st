tests
testFormTest3
	| input part entity request response contents |
	input := 'contents-' , 999 atRandom asString.
	request := ZnRequest post: '/form-test-3'.
	entity := ZnMultiPartFormDataEntity new.
	part := ZnMimePart
				fieldName: 'file'
				fileName: 'input.txt'
				entity: (ZnEntity with: input).
	entity addPart: part.
	request entity: entity.
	response := ZnDefaultServerDelegate new handleRequest: request.
	self assert: response isSuccess.
	contents := response contents.
	self assert: (contents includesSubstring: 'input.txt').
	self assert: (contents includesSubstring: input).