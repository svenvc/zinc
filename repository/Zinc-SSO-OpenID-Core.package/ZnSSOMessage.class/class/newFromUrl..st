instance creation
newFromUrl: anUrl

	| instance |
	
	instance := self new.
	anUrl asZnUrl queryDo: [ :key :value | instance propertyAt: key put: value ].
	^ instance