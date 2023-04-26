accessing
at: key put: value
	"Store value under key on the server, returning the URI"

	^ self httpClient
		put: 'kvstore/', key asString
		contents: value asString