accessing
messageText
	^ super messageText
		ifEmpty: [ self file ifNotNil: [ self file fullName ] ifNil: [ '' ] ]