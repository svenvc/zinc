testing
testGetMultParam
	self ignoringDeprecation: [ | client response |
		client := ZnHttpClient new
			url: 'http://homepage.mac.com/svc/Zinc-HTTP-Components/small.html';
			parameterAt: 'test' add: 'value1';
			parameterAt: 'test' add: 'value2'.
		self assert: (client params at: 'test') isArray.
		response := client get.
		self assert: response notNil.
		self assert: client status = 200 ]