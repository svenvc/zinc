accessing-path
closePath
	self isSlash
		ifFalse: [ self addPathSegment: #/ ]