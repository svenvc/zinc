operations
get: uri
	| request |
	request := ZnRequest get: (self fixedUrl: uri).
	^ self executeRequest: request