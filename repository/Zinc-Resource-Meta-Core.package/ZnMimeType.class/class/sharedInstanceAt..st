private
sharedInstanceAt: key
	"Look up and return a predefined instance known under key.
	See #initializeMimeTypes for the full list.
	The returned instance should not be modified."
	
	^ MimeTypes at: key