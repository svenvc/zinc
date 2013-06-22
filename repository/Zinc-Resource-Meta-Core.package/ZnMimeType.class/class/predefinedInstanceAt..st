accessing
predefinedInstanceAt: key
	"Look up and return a predefined instance known under key.
	I return a copy that can be modified.
	See #initializeMimeTypes for the full list."
	
	^ (self sharedInstanceAt: key) copy