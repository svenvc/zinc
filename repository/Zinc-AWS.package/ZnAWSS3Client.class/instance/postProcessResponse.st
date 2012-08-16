private protocol
postProcessResponse
	self checkIntegrity 
		ifTrue: [ self enforceContentHash ]