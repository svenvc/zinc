tests
testRedirect
	| url key |
	url := 'https://pharo.org' asUrl.
	key := ZnUrlShortenerDelegate shorten: url.
	self withServerDo: [ :server | | client |
		client := ZnClient new url: server url; addPathSegment: key.
		client followRedirects: false.
		client get.
		self assert: client response isRedirect.
		self assert: client response location asUrl equals: url.
		client close ]