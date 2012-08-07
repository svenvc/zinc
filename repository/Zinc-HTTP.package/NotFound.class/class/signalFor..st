instance creation
signalFor: anObject
	"Create and signal a NotFond exception for anObject in the default receiver."
	
	^ self new
		object: anObject;
		signal