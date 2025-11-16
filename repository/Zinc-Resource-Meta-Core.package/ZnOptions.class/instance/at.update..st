accessing
at: key update: block
	| newValue |
	writable
		ifFalse: [ (ModificationForbidden
				for: self
				at: key
				with: block
				retrySelector: #at:put:) signal ].
	(parent isNotNil and: [ parent includesKey: key ])
		ifFalse: [ KeyNotFound signalFor: key in: self ].
	options ifNil: [ options := Dictionary new ].
	newValue := block value: (self at: key).
	^ options at: key put: newValue