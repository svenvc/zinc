instance creation
newForEncoding: string
	"Return a new character encoder object for an encoding described by string.
	Search for a subclass that handles it and delegate (subclassResponsibility).
	We default to ZnNullEncoder."
	
	| concreteSubclass encoding |
	encoding := string asLowercase.
	concreteSubclass := self subclasses 
		detect: [ :each | each handlesEncoding: encoding ] 
		ifNone: [ ZnNullEncoder ].
	^ concreteSubclass newForEncoding: encoding