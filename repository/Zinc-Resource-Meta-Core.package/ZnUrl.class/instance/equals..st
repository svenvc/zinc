comparing
equals: url
	self scheme = url scheme ifFalse: [ ^ false ].
	self host = url host ifFalse: [ ^ false ].
	self portOrDefault = url portOrDefault ifFalse: [ ^ false ].
	((self isSlash and: [ url isSlash ]) or: [ self segments = url segments ]) ifFalse: [ ^ false ].
	self query = url query ifFalse: [ ^ false ].
	self fragment = url fragment ifFalse: [ ^ false ].
	^ true