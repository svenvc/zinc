testing
testGet
	self ignoringDeprecation: [ | client response |
		client := ZnHttpClient new.
		response := client
			url: 'http://homepage.mac.com/svc/Zinc-HTTP-Components/small.html';
			get.
		self assert: response notNil.
		self assert: client status = 200 ]