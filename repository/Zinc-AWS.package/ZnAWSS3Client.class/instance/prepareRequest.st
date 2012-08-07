private protocol
prepareRequest
	self checkIntegrity 
		ifTrue: [ self addContentHash ].
	self addAuthorization
	

