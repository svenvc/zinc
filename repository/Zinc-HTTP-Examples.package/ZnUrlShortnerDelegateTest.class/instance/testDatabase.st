tests
testDatabase
	| url key |
	url := 'https://pharo.org' asUrl.
	key := ZnUrlShortenerDelegate shorten: url.
	self
		assert: (ZnUrlShortenerDelegate database at: key)
		equals: url.