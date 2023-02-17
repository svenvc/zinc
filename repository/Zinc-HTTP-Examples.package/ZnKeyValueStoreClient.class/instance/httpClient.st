accessing
httpClient
	"Return the HTTP client that I (re)use.
	This ZnClient instance can be customized."

	^ httpClient ifNil: [ httpClient := self makeHttpClient ]