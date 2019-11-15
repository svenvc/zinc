parameters
parameterAt: key ifAbsent: block

	parameters ifNil: [ ^ block value ].
	^ self parameters at: key ifAbsent: block