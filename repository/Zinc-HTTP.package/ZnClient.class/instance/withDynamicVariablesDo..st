private
withDynamicVariablesDo: block
	^ self localOptions conditionallyDuring: block