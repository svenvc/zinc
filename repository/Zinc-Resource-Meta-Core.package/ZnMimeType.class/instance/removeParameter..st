parameters
removeParameter: key

	parameters ifNil: [ ^ self ].
	^ self parameters removeKey: key ifAbsent: [ nil ]