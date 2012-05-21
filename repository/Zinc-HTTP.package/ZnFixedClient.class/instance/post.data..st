operations
post: uri data: entity
	| request |
	(request := ZnRequest post: (self fixedUrl: uri))
		entity: entity.
	^ self executeRequest: request