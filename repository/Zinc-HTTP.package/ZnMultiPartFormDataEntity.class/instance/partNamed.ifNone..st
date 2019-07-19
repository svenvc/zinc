accessing
partNamed: fieldName ifNone: block

	parts ifNil: block.
	^ self parts detect: [ :each | each fieldName = fieldName ] ifNone: block