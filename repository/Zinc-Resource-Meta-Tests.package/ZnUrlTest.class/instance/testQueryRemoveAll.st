testing
testQueryRemoveAll
	#('http://foo.com/test' 'http://foo.com/test?')
		do: [ :each |
			| url |
			url := 'http://foo.com/test?name=value' asZnUrl.
			self deny: url equals: each asZnUrl.
			url queryRemoveAll.
			self
				assert: url query isEmpty;
				assert: url equals: each asZnUrl ]