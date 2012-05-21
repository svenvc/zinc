accessing-path
addPathSegment: segment
	segments isNil ifTrue: [ 
		segments := OrderedCollection new ].
	segments add: segment