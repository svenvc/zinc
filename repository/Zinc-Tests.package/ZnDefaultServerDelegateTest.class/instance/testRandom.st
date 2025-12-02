tests
testRandom
	| request response random |
	request := ZnRequest get: '/random/128'.
	response := ZnDefaultServerDelegate new handleRequest: request.
	self assert: response isSuccess.
	random := response contents.
	self assert: random size equals: 128.
	"make sure we get a different response"
	response := ZnDefaultServerDelegate new handleRequest: request.
	self deny: response contents equals: random