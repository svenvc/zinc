as yet unclassified
md5Hash: aString
	| hex hash |
	hex := aString md5sum hex.
	hash := hash hex asLowercase.
	(hash beginsWith: '16r') ifTrue: [ hash := hash allButFirst: 3 ].
	hash := hash padded: #left to: 32 with: $0 .
	^hash