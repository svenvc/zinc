actions
sign: aString andCheck: aSignature
	^ self shouldCheckSignature
		ifTrue: [ super sign: aString andCheck: aSignature ]
		ifFalse: [ true ]