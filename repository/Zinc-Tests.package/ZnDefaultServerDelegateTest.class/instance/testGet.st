tests
testGet
	| request response contents |
	"specify a full URL to set the host header"
	request := ZnRequest get: 'https://ci.example.com:8080/echo?test=true'.
	response := ZnDefaultServerDelegate new handleRequest: request.
	self assert: response isSuccess.
	contents := response contents.
	self assert: (contents includesSubstring: 'ci.example.com:8080').
	self assert: (contents includesSubstring: 'test=true').