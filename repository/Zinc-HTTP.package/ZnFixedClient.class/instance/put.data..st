operations
put: uri data: entity
	| request |
	(request := ZnRequest put: (self fixedUrl: uri))
		entity: entity.
	^ self executeRequest: request