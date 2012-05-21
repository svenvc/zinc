operations
delete: uri
	| request |
	request := ZnRequest delete: (self fixedUrl: uri).
	^ self executeRequest: request