public
match: request
	^ request uri firstPathSegment = 'sum'
		ifTrue: [ request uri pathSegments allButFirst ]
		ifFalse: [ nil ]