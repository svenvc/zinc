accessing
at: key
	^ self value
		ifNil: [ ZnOptions globalDefault at: key ]
		ifNotNil: [ :options | options at: key ]