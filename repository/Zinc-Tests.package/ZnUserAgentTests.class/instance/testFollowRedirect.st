testing
testFollowRedirect
	self ignoringDeprecation: [ | url client response |
		url := 'http://www.pharo-project.org/' asZnUrl.
		client := ZnUserAgent new.
		client settings followRedirect: false.
		response := client get: url.
		self assert: response isRedirect.
		client settings followRedirect: true.
		response := client get: url.
		self assert: response isSuccess ]