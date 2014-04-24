accessing
match: request
	self isAbstract ifTrue: [ ^ nil ].
	^ ZnRestServerUtils 
		matchPath: request uri pathSegments 
		pattern: self pattern   