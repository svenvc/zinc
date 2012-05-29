as yet unclassified
nextLine
	self reset.
	[ self processNext isNil ] whileFalse.
	^ buffer copyFrom: 1 to: position