accessing
linesDo: block

	[ self atEnd ] whileFalse: [ self nextLine ifNotNil: block ]