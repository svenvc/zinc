testing
testGet
	self ignoringDeprecation: [ | client response |
		client := ZnHttpClient new.
		response := client
			url: 'http://zn.stfx.eu/zn/small.html';
			get.
		self assert: response notNil.
		self assert: client status = 200 ]