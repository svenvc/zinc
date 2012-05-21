private
concreteSubclassForType: mimeType binary: forceBinary
	"Answer the concrete ZnEntity subclass that handles mimeType"
	
	^ self allSubclasses 
		detect: [ :each | 
			each designatedMimeType = mimeType ]
		ifNone: [ 
			(mimeType isBinary or: [ forceBinary ])
				ifTrue: [ self byteArrayEntityClass ] 
				ifFalse: [ self stringEntityClass ] ]
