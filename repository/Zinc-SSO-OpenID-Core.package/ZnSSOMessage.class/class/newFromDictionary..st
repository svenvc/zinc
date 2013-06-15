instance creation
newFromDictionary: aDictionary

	| instance |
	
	instance := self new.
	aDictionary keysAndValuesDo: [ :key :value | 
		(self propertyPrefix = '' or: [ key beginsWith: self propertyPrefix ])
			ifTrue: [ instance propertyAt: key put: value ] ].
	^ instance