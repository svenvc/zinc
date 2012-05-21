accessing-path
addPathSegments: pathSegments
	pathSegments do: [ :each | self addPathSegment: each ]