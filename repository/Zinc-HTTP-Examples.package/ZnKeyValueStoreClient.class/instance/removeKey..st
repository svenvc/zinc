accessing
removeKey: key
	"Remove key from the server, if present, returning the URI"

	^ self httpClient delete: 'kvstore/', key asString