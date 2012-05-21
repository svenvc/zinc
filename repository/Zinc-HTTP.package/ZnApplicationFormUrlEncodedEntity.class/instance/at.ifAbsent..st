accessing
at: key ifAbsent: block
	self invalidateRepresentation.
	^ self fields at: key ifAbsent: block