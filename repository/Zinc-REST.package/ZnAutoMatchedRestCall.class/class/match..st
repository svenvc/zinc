accessing
match: request
	^ ZnRestServerUtils 
		matchPath: request uri pathSegments 
		pattern: self pattern   