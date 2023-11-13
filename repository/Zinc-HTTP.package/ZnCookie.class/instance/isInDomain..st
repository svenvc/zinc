testing
isInDomain: urlObject
	| domain |
	domain := (self domain beginsWith: '.')
		ifTrue: [ self domain allButFirst ]
		ifFalse: [ self domain ].
	^ urlObject host includesSubstring: domain
