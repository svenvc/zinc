testing
isAbsolute
	"We consider URLs with scheme://host as absolute (port is not relevant here).
	See also #inContextOf: Path merging is not supported."
	
	^ self hasScheme and: [ self hasHost ]