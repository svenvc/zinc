public
get
	| predicateKeys |
	predicateKeys := request uri queryKeys.
	predicateKeys isEmpty
		ifTrue: [ self jsonResponse: self delegate storage keys ]
		ifFalse: [ 
			| objectKeys |
			objectKeys := OrderedCollection new.
			self delegate storage
				keysAndValuesDo: [ :key :value | 
					(predicateKeys allSatisfy: [ :each | (value at: each ifAbsent: [ nil ]) = (request uri queryAt: each) ])
						ifTrue: [ objectKeys add: key ] ].
			self jsonResponse: objectKeys ]