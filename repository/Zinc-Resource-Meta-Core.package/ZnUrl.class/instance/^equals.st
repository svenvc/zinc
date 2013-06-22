comparing
= anObject
	^ self class == anObject class 
		and: [ self equals: anObject ]