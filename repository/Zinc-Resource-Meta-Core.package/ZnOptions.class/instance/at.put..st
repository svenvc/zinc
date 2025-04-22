accessing
at: key put: value
	writable
		ifFalse: [ (ModificationForbidden
				for: self
				at: key
				with: value
				retrySelector: #at:put:) signal ].
	(parent isNotNil and: [ parent includesKey: key ])
		ifFalse: [ KeyNotFound signalFor: key in: self ].
	options ifNil: [ options := Dictionary new ].
	^ options at: key put: value