comparing
= anObject
	^ (anObject isKindOf: self class) and: [ self localId = anObject localId and: [ self opEndpoint = anObject opEndpoint ] ]