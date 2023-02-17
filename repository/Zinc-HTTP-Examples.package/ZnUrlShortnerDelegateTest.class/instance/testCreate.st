tests
testCreate
	| url |
	url := ('https://pharo.org/tst-' , 9999 atRandom asString) asUrl.
	self withServerDo: [ :server | | client shortUrl |
		client := ZnClient new url: server url; queryAt: #url put: url.
		client get.
		shortUrl := client response contents.
		client followRedirects: false.
		client get: shortUrl.
		self assert: client response isRedirect.
		self assert: client response location asUrl equals: url.
		client close ]